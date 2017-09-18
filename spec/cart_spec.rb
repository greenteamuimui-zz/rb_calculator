require 'rspec'
require 'cart'
require 'json'

describe Cart do

  let(:cartlist) do
    JSON.parse(File.read("spec/json_examples/cart-9363.json"))
  end

  subject(:cart) {Cart.new}

  describe "#initialize" do
    it "creates and empty store for cartitems" do
      expect(cart.store).to eq([])
    end
  end

  describe "#add_items" do

    it "raises 'Cart list is empty' error when the cartlist is empty" do
      expect do
        cart.add_items([])
      end.to raise_error("Cart list is empty")
    end

    it "creates new CartItem instances using the cartlist" do
      cart.add_items(cartlist)
      expect(cart.store).to include(CartItem)
    end

    it "adds the cartitems to the cart's store" do
      cart.add_items(cartlist)
      expect(cart.store.count).to eq(cartlist.count)
    end
  end

  describe "#calculate_price" do

    let(:price_service) do
      double("price_service", "price_lookup" => 100)
    end

    it "returns the total price of the cart" do
      cart.add_items(cartlist)
      expect(cart.calculate_price(price_service)).to eq(200)
    end
  end
end
