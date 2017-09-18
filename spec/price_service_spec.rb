require 'rspec'
require 'price_service'
require 'json'

describe PriceService do
  subject(:price_service) {PriceService.new}

  let(:catalog) do
    JSON.parse(File.read("spec/json_examples/base-prices.json"))
  end

  describe "#initialize" do
    it "stores the catalog" do
      expect(price_service.catalog).not_to be_nil
    end
  end

end
