require 'rspec'
require 'cart_item'

describe CartItem do

  let(:item_description_hash) do
  [{
      produc_type: "hoodie",
      options: {
        size: "small",
        colour: "white",
        print_location: "front"
      },
      artist_markup: 20,
      quantity: 1
    }]
  end
  subject(:cart_item) {CartItem.new(item_description_hash)}

  describe '#initialize' do
    it "sets a product type attribute" do
      expect(cart_item.product_type).to eq("hoodie")
    end
    it "sets a options attribute" do
      expect(cart_item.options).to eq(item_description_hash["options"])
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
