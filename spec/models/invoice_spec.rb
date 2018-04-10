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
                xml.vNF 200.0
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

    base_number = 10

    @valid_xml_collection = []
    for i in 0..10 do
      xml = create_xml_file base_number + i
      @valid_xml_collection.push(xml.to_xml)
    end

    @invalid_xml_collection = []
    for i in 0..10 do
      xml = create_xml_file base_number +i
      @invalid_xml_collection.push(xml.to_xml)
    end
    xml = create_xml_file base_number + 15
    @invalid_xml_collection.push(xml.to_xml)

    @empty_collection = []
  end

  it "sucessfully get xml content by tag (single)" do
    result = Invoice.get_xml_content_by_tag('nNF', @valid_xml_file.to_xml)
    result2 = Invoice.get_xml_content_by_tag('vNF', @valid_xml_file.to_xml )

    expect(result.first).to eq('474423')
    expect(result2.first).to eq('200.0')
  end

  it 'returns nil searching for inexistent tag' do
    error = Invoice.get_xml_content_by_tag('IDontHaveThisTag', @valid_xml_file.to_xml)
    expect(error.first).to eq(nil)
  end

  it "successfully determines missing invoices" do
    expect(Invoice.missing_invoices(@valid_xml_collection, false)).to eq([])
    expect(Invoice.missing_invoices(@invalid_xml_collection, false)).to eq([21,22,23,24])
    expect(Invoice.missing_invoices(@empty_collection, false)).to eq([])
  end

  it "returns greatest invoice number" do
    expect(Invoice.missing_invoices(@valid_xml_collection, true)).to eq(20)
  end


end
