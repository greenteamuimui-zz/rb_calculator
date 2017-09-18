class PriceService
  attr_reader :price_catalog, :catalog_hash

  def initialize(price_catalog)
    @price_catalog = price_catalog
    @catalog_hash = Hash.new
    hashmap_items_to_prices
  end

  def price_lookup(item)
    product_category = item.product_type
    query = create_item_query(item)
    base_price = @catalog_hash[product_category][query]
    (base_price + (base_price * item.artist_markup_percentage).round) * item.quantity
  end

  private

  def create_item_query(item)
    product_category = item.product_type
    query = ""
    if @catalog_hash[product_category]["option_types"].empty?
      query = "none-"
    end
    @catalog_hash[product_category]["option_types"].each do |option_type|
      query += "#{item.options[option_type]}-"
    end
    query[0...-1]
  end


  def hashmap_items_to_prices
    @price_catalog.each do |catalog_item|
      product_category = catalog_item["product-type"]
      @catalog_hash[product_category] = Hash.new unless @catalog_hash[product_category]
      options_keys = catalog_item["options"].keys.sort
      @catalog_hash[product_category]["option_types"] = options_keys

      if options_keys.empty?
        create_objects_with_no_option(product_category, catalog_item)
      elsif options_keys.count == 1
        create_objects_with_one_option(product_category, options_keys[0], catalog_item)
      else
        create_objects_with_multiple_options(product_category, options_keys, catalog_item)
      end
    end
  end

  def create_objects_with_no_option(product_category, catalog_item)
    @catalog_hash[product_category]["none"] = catalog_item["base-price"]
  end

  def create_objects_with_one_option(product_category, option, catalog_item)
    catalog_item["options"][option].each do |value|
      @catalog_hash[product_category][value] = catalog_item["base-price"]
    end
  end

  def create_objects_with_multiple_options(product_category, options_keys, catalog_item)
    options_strings = []
    option1 = options_keys.first
    options_keys[1..-1].each do |options_key|
      options_strings = catalog_item["options"][option1].product(catalog_item["options"][options_key]).map{|item| item.join("-")}
      option1 = options_strings
    end
    options_strings.each do |options_string|
      @catalog_hash[product_category][options_string] = catalog_item["base-price"]
    end
  end

end
