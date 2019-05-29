World(CheckoutHelper)

Given(/^i login with new account$/) do
  visit "/"
  finished_all_ajax_requests?
  @params = {email: "#{@ownertempmail}", password: "123456", content: "Dashboard"}
  function_login_with_spesific_account(@params)
  top_loading_bar
  expect_page_to_have_content(@params)
end

Then(/^i access Library to create item$/) do
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
end

Then(/^i make checkout transaction$/) do
  get_api_spesific_item
  create_basic_checkout_transaction
  puts "Successfully create transaction (Checkout) with item #{@checkout_params[:checkout][:items][0][:item_name]}
  \nwith receipt_numbers: #{@checkout_params[:checkout][:receipt_number]}"
  sleep(5)
end

Then(/^i delete created items$/) do
  visit "/library/list"
  @params = {item_name: "#{@get_item_name}"}
  delete_filtered_item_list(@params)
  puts "Item with name => (#{@params[:item_name]}) successfully deleted"
end

Then(/^check new account reporting and make sure transaction recorded on Report \- Transaction$/) do
  visit "/reports/transactions"
  @params = {css: "#mixpanel-notification-cancel > div"}
  pop_up = expect_page_to_have_css(@params)
  if pop_up == true
    find("#mixpanel-notification-cancel > div").click
  end
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
