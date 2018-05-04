require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    @user = FactoryBot.build(:user, email:'user@email.com', password: 'password')
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

describe 'adding DAS file to user', type: :feature do

  before :each do
    @user = FactoryBot.build(:user)
    @user.confirm
    login_as(@user, :scope => :user)
  end


  it "successfully submit DAS file attachment form" do
    url = "users/#{@user.id}/add_das"
    visit url
    attach_file('user[das_file]', Rails.root + "spec/fixtures/files/xml_file.xml")
    click_button 'Enviar'
    expect(@user.das_file).not_to be(nil)
  end

end
