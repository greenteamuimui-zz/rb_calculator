# RB Price Calculator Command-line program

## Description

This command-line program take two arguments:

  1. JSON file representing a cart(cartlist)
  2. JSON file representing a list of base prices(price catalog)

and calculates the price of the total cart and outputs the values in cents.

## Installation
  1. Git clone the project into the appropriate directory
  2. Run `cd price_cart_program/`
  3. Install the required gems running the line `bundle install` in the top directory
  4. Run `ruby redbubble_system_command.rb [full_path_to_the_cart_json_file] [full_path_to_the_base_prices_list_json_file]`

### Example
`ruby redbubble_system_command.rb /home/greenteamuimui/Job_Search/code_challenges/price_cart_program/spec/json_examples/cart-4560.json /home/greenteamuimui/Job_Search/code_challenges/price_cart_program/spec/json_examples/base-prices.json`

## How to run the tests
  1. Run `rspec spec/`
