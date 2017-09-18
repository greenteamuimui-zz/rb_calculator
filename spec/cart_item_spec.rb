require 'rspec'
require 'cart_item'
require 'json'

describe CartItem do

  let(:cartlist) do
    JSON.parse(File.read("spec/json_examples/cart-4560.json"))
  end
  subject(:cart_item) {CartItem.new(cartlist[0])}

  describe '#initialize' do
    it "sets a product type attribute" do
      expect(cart_item.product_type).to eq("hoodie")
    end
    it "sets a options attribute" do
      expect(cart_item.options).to eq(cartlist[0]["options"])
    end
    it "sets a artist markup percentage attribute" do
      expect(cart_item.artist_markup_percentage).not_to be_nil
    end
    it "sets a product type attribute" do
      expect(cart_item.quantity).to eq(1)
    end

    it "pre-calculates the artist mark-up in percentage as a float" do
      expect(cart_item.artist_markup_percentage).to eq(0.2)
    end
  end

end
