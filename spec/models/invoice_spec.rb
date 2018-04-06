require 'rails_helper'

RSpec.describe Invoice, type: :model do

  def create_xml_file nnf
    xml_file = Nokogiri::XML::Builder.new do |xml|
      xml.root{
        xml.nfeProc {
          xml.NFe{
            xml.infNFe{
              xml.ide{
                xml.nNF nnf
              }
            }
          }
        }
      }
    end
    return xml_file
  end

  before(:each) do
    @valid_xml_file = create_xml_file 474423
    ## "Invalid" XML doesn't contain the field we look for
    @invalid_xml_file = ""

    random_number = Faker::Number.number(6).to_i

    @valid_xml_collection = []
    for i in 0..10 do
      xml = create_xml_file random_number + i
      @valid_xml_collection.push(xml.to_xml)
    end

    @invalid_xml_collection = []
    for i in 0..10 do
      xml = create_xml_file random_number +i
      @invalid_xml_collection.push(xml.to_xml)
    end
    xml = create_xml_file random_number + 20
    @invalid_xml_collection.push(xml.to_xml) 

    @empty_collection = []

  end

  #Regex to be used /<nNF>(.*)<\/nNF>/
  it "successfully gets xml serial number" do
    result = Invoice.get_xml_serial_number(@valid_xml_file.to_xml)
    error = Invoice.get_xml_serial_number(@invalid_xml_file)
    expect(result).to eq('474423')
    expect(error).to eq(nil)
  end

  it "successfully determines missing invoices" do
    expect(Invoice.missing_invoices? @valid_xml_collection).to be(false)
    expect(Invoice.missing_invoices? @invalid_xml_collection).to be(true)
    expect(Invoice.missing_invoices? @empty_collection).to be(false)
  end

end
