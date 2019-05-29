World(ShowMeTheCookies)
World(CheckoutHelper)

Given(/^i navigate backoffice$/) do
  visit "/"
  login_using_checkout_account
  top_loading_bar
end

Then(/^i create checkout transaction$/) do
  visit "/library/list"
  top_loading_bar
  button_create_item_library
  top_loading_bar
  @params = {item_name: "SEITC-#{Time.now.to_i}", price: "35000"}
  fill_item_name(@params)
  set_price_single_variant(@params)
  button_save_item_library_to_current_outlet
  top_loading_bar
  button_cancel_on_form
  @params = {item_name: @params[:item_name]}
  filter_search_item_name(@params)
  top_loading_bar
  get_api_spesific_item
  create_basic_checkout_transaction
  puts "Successfully create transaction (Checkout) with item #{@checkout_params[:checkout][:items][0][:item_name]}
  \nwith receipt_numbers: #{@checkout_params[:checkout][:receipt_number]}"
end

Then(/^check reporting and make sure transaction recorded on Report \- Transaction$/) do
  visit "/reports/transactions"
  button_click_filter_date
  @params = {range: "Today"}
  change_calendar_range_box(@params)
  top_loading_bar
  @params = {keyword: "#{@checkout_params[:checkout][:receipt_number]}"}
  search_receipt_number_transaction_report(@params)
  top_loading_bar
  button_click_list_receipt_detail
  top_loading_bar
  @total = get_total_collected_spesific_receipt
  within("#receipt") do
    @params = {content: "#{@total}"}
    expect_page_to_have_content(@params)
  end
  button_done_on_receipt_details
end
