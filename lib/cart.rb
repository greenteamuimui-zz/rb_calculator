require_relative 'cart_item'

class Cart
  attr_reader :store

  def initialize
    @store = []
  end

  def add_items(cartlist)
    raise "Cart list is empty" if cartlist.empty?
    cartlist.each do |item_description_hash|
      @store << CartItem.new(item_description_hash)
    end
  end

  def calculate_price(price_service)
    total = 0
    @store.each do |item|
      total += price_service.price_lookup(item)
    end
    total
  end
end
