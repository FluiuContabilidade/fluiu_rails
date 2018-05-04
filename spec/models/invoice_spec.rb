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
                xml.vNF 1.0
                xml.CNPJ 34534220000117
                xml.CNPJ 34512134233417
                xml.CFOP 5102
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

  describe ".get_xml_content_by_tag" do

    it 'return when tag exists' do
      result = Invoice.get_xml_content_by_tag('nNF', @valid_xml_file.to_xml)
      expect(result.first).to eq('474423')
    end

    it 'returns nil when tag does not exist' do
      error = Invoice.get_xml_content_by_tag('IDontHaveThisTag', @valid_xml_file.to_xml)
      expect(error.first).to eq(nil)
    end
  end


  describe ".missing_invoices" do

    it 'returns maximum invoice number when rmaxflag is true' do
        expect(Invoice.missing_invoices(@valid_xml_collection, true)).to eq(20)
    end

    it 'returns if collection is valid when flag is false' do
      expect(Invoice.missing_invoices(@valid_xml_collection, false)).to eq([])
      expect(Invoice.missing_invoices(@invalid_xml_collection, false)).to eq([21,22,23,24])
      expect(Invoice.missing_invoices(@empty_collection, false)).to eq([])
    end

  end

  describe ".price_sum" do
    it "returns sum of invoices" do
      expect(Invoice.price_sum(@valid_xml_collection)).to eq(11.0)
    end
  end

  describe ".entry_type?" do
    it "returns if invoice type is of entry type" do
      expect(Invoice.entry_type?(@valid_xml_file.to_xml, '34534220000117')).to be(true)
      expect(Invoice.entry_type?(@valid_xml_file.to_xml, '30120310231203')).to be(false)
      expect(Invoice.entry_type?(@invalid_xml_file, '34534220000117')).to be(false)
    end
  end

  describe ".is_a_local_invoice?" do
    it "returns if invoice is of local type" do
      expect(Invoice.is_a_local_invoice? @valid_xml_file.to_xml).to be(true)
    end
  end


end
