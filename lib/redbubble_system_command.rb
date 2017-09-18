require_relative 'redbubble_system'

rb_system = RedBubbleSystem.new
cartlist_json_location, catalog_json_location = ARGV
rb_system.run(cartlist_json_location, catalog_json_location)
