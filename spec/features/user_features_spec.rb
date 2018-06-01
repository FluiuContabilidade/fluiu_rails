require 'rails_helper'

describe "the signin process", type: :feature do

  before :each do
    @user = FactoryBot.build(:user, email:'user@email.com', password: 'password', role: 'admin')
    @user.confirm
  end

  it "signs me in" do
    visit '/users/sign_in'

    within("#email-field") do
      fill_in 'email', with: 'user@email.com'
    end

    within("#password-field") do
      fill_in 'password', with: 'password'
    end

    click_button 'Entrar'
    expect(page).to have_content 'Rotinas Contábeis'
  end
end

describe 'adding taxes file to user', type: :feature do

  before :each do
    @user = FactoryBot.build(:user, role: 'admin')
    @user.confirm
    login_as(@user, :scope => :user)
  end

  it "successfully submit tax files form" do
    url = "users/#{@user.id}/add_tax_files"
    visit url
    attach_file('user[das_file]', Rails.root + "spec/fixtures/files/xml_file.xml")
    attach_file('user[fgts]', Rails.root + "spec/fixtures/files/xml_file.xml")
    attach_file('user[inss]', Rails.root + "spec/fixtures/files/xml_file.xml")
    attach_file('user[fau]', Rails.root + "spec/fixtures/files/xml_file.xml")
    attach_file('user[tributary_sub]', Rails.root + "spec/fixtures/files/xml_file.xml")
    attach_file('user[payment_installments]', Rails.root + "spec/fixtures/files/xml_file.xml")
    click_button 'Enviar'
    expect(@user.das_file).not_to be(nil)
    expect(@user.fgts).not_to be(nil)
    expect(@user.inss).not_to be(nil)
    expect(@user.fau).not_to be(nil)
    expect(@user.tributary_sub).not_to be(nil)
    expect(@user.payment_installments).not_to be(nil)
  end

  it 'submits empty form' do
    url = "users/#{@user.id}/add_tax_files"
    visit url
    click_button 'Enviar'
    expect(page).to have_content("Clientes")
  end
end

describe 'the opening status change process' do

  before :each do
    @user = FactoryBot.build(:user, role: 'admin')
    @user.confirm
    login_as(@user, :scope => :user)
  end

  it "Successfully submits opening status change form" do
    url = "users/#{@user.id}/opening_status_change"
    visit url
    fill_in 'message', with: Faker::OnePiece.quote
    click_button 'Enviar'
    expect(page).to have_content('Rotinas Contábeis')
  end
end
