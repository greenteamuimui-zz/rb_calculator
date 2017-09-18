require 'rspec'
require 'json'
require 'redbubble_system'

describe RedBubbleSystem do

  subject(:rb_system) {RedBubbleSystem.new}

  let(:cartlist_json_location) {"/home/greenteamuimui/Job_Search/code_challenges/price_cart_program/spec/json_examples/cart-4560.json"}

  let(:catalog_json_location) {"/home/greenteamuimui/Job_Search/code_challenges/price_cart_program/spec/json_examples/base-prices.json"}

  describe "#run" do
    before(:each) do
      rb_system.run(cartlist_json_location, catalog_json_location)
    end
    it "creates a catalog instance variable" do
      expect(rb_system.catalog).not_to be_nil
    end

    it "stores and creates a cart instance" do
      expect(rb_system.cart).to be_a(Cart)
    end

    it "prints the total price of the cart to stdout" do
      expect{rb_system.run(cartlist_json_location, catalog_json_location)}.to output("The total price of this cart is 4560\n").to_stdout
    end
  end
end
