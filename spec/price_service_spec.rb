require 'rspec'
require 'price_service'
require 'json'

describe PriceService do
  let(:price_catalog) do
    JSON.parse(File.read("spec/json_examples/base-prices.json"))
  end
  subject(:price_service) {PriceService.new(price_catalog)}

  describe "#initialize" do
    it "stores the catalog" do
      expect(price_service.price_catalog).to eq(price_catalog)
    end

    it "creates and store a price catalog hash" do
      expect(price_service.catalog_hash).to be_a(Hash)
    end

  end

  describe "#price_lookup" do
    let(:item_multiple_options) do
      double("item_multiple_options",
      "product_type" => "hoodie",
        "options" => {
        "size" => "small",
        "colour" => "white",
        "print_location" => "front"
      },
      "artist_markup_percentage" => 0.2,
      "quantity" => 1
      )
    end

    let(:item_one_options) do
      double("item_one_options",
      "product_type" => "sticker",
        "options" => {
        "size" => "medium",
      },
      "artist_markup_percentage" => 0.1,
      "quantity" => 1
      )
    end

    let(:item_no_options) do
      double("item_no_options",
      "product_type" => "leggings",
        "options" => {
      },
      "artist_markup_percentage" => 0.2,
      "quantity" => 1
      )
    end

    it "returns the right price for an item with multiple options" do
      expect(price_service.price_lookup(item_multiple_options)).to eq(4560)
    end

    it "returns the right price for an item with one options" do
      expect(price_service.price_lookup(item_one_options)).to eq(641)
    end

    it "returns the right price for an item with no options" do
      expect(price_service.price_lookup(item_no_options)).to eq(6000)
    end

  end

end
