class CartItem
  attr_reader :product_type, :options, :artist_markup_percentage, :quantity

  def initialize(item_description_hash)
    @product_type = item_description_hash["product-type"]
    @options = item_description_hash["options"]
    @artist_markup_percentage = (item_description_hash["artist-markup"].to_f / 100)
    @quantity = item_description_hash["quantity"]
  end
end
