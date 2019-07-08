Then(/^I hit Item Library API$/) do
  visit_library_item_library
  @randomize = Time.now.to_i
  @param = {
    item_name: "suha-#{@randomize}",
    item_price: rand(10000..50000),
  }
  create_item_for_checkout(@param)
end

Then(/^I hit Mobile Checkout API$/) do
  fill_in "search", with: @param[:item_name]

  @item = get_api_spesific_item
  @item_id = @item["items"][0]["id"]
  @item_price = @item["items"][0]["item_variants"][0]["price"].to_i
  @item_name = @item["items"][0]["name"]
  @item_variant_id = @item["items"][0]["item_variants"][0]["id"]
  @item_category_id = @item["items"][0]["category_id"]

  @checkout = create_basic_checkout_transaction
  @total_price = @checkout["checkouts"][0]["total_price"].to_i
  @receipt_no = @checkout["payment_no"]
  @cust_email = @checkout["customer_email"]
  @cust_name = @checkout["customer_name"]

  @total_price_api = ActiveSupport::NumberHelper.number_to_delimited(@total_price, :delimiter => ".")
end
