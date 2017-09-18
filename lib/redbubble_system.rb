require 'json'
require_relative 'price_service'
require_relative 'cart'

class RedBubbleSystem
  attr_reader :catalog, :cart

  def run(cartlist_json_location, catalog_json_location)
    cartlist = JSON.parse(File.read("#{cartlist_json_location.chomp}"))
    @catalog = JSON.parse(File.read("#{catalog_json_location.chomp}"))
    @cart = Cart.new
    @cart.add_items(cartlist)
    print "The total price of this cart is #{display_price}\n"
  end

  def display_price
    raise "Catalog is empty" if @catalog.empty?
    price_service = PriceService.new(@catalog)

    @cart.calculate_price(price_service)
  end
end
