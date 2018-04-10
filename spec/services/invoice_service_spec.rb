require 'rails_helper'

RSpec.describe InvoicesService, type: :service do

  it 'formats data successfully' do
    result = InvoicesService.format_date '2018-02-27T23:58:00-03:00'
    expect(result).to eq('2018-02')
  end

end
