module CheckoutHelper

  def get_api_spesific_item
    @cookie = get_me_the_cookie('remember_token')
    item_params = Curl.get("https://#{ENV['ENVIRONMENT']}.mokapos.com/api/v3/items") do |curl|
      curl.headers['Content-Type'] = 'application/json'
      curl.headers['Cookie'] = "remember_token=#{@cookie[:value]}"
      curl.headers['User-Agent'] = 'capybara'
    end
    json = JSON.parse(item_params.body)
    @item_params = json["results"][0]
    @get_item_name = @item_params["name"]
    @get_item_price = @item_params["item_variants"][0]["price"]
    @get_item_id = @item_params["id"]
    @get_item_variant_id = @item_params["item_variants"][0]["id"]
    @get_category_id = @item_params["category"]["id"]
  end

  def create_basic_checkout_transaction
    @year = Time.now.year
    @month = Time.now.month
    @day = Time.now.day
    @hour = Time.now.hour
    @min = Time.now.min
    @sec = Time.now.sec
    # For receipt number randomize
    @receipt_number_randomize = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(3).join

    @checkout_params = { "checkout": {
        "total_collected": "#{@get_item_price}",
        "subtotal": "#{@get_item_price}",
        "items": [
          {
            "item_name": "#{@get_item_name}",
            "tax": "0",
            "category_name": "Uncategorized",
            "client_price": "#{@get_item_price}",
            "discount_amount": "0",
            "item_variant_sku": "",
            "order_status": "New Order",
            "net_sales": "#{@get_item_price}",
            "quantity": "1",
            "gratuity": "0",
            "item_variant_name": "",
            "is_program_item": false,
            "item_id": @get_item_id,
            "item_variant_id": @get_item_variant_id,
            "track_stock": false,
            "gross_sales": "#{@get_item_price}",
            "category_id": @get_category_id
          }
        ],
        "enable_gratuity": false,
        "is_offline": false,
        "client_created_at": "#{@year}-#{@month}-#{@day}T#{@hour}:#{@min}:#{@sec}.110847+07:00",
        "transaction_date": "#{@year}-#{@month}-#{@day}T#{@hour}:#{@min}:#{@sec}.186080+07:00",
        "amount_pay": "50000",
        "include_tax_and_gratuity": false,
        "total_gross_sales": "#{@get_item_price}",
        "total_net_sales": "#{@get_item_price}",
        "uniq_id": 1,
        "is_loyalty": false,
        "total_gratuity": "0",
        "is_sales_type": false,
        "payment_type": "cash",
        "enable_tax": false,
        "total_discount": "0",
        "receipt_number": "ICD#{@receipt_number_randomize}",
        "total_tax": "0",
        "is_refund_transaction": false,
      }
    }

    @cookie = get_me_the_cookie('remember_token')
    http = Curl.post("https://#{ENV['ENVIRONMENT']}.mokapos.com/api/v2/checkouts", @checkout_params.to_json) do |http|
      http.headers['Accept'] = 'application/json'
      http.headers['Content-Type'] = 'application/json'
      http.headers['Cookie'] = "remember_token=#{@cookie[:value]}"
      http.headers['User-Agent'] = 'capybara'
    end
    JSON.parse(http.body)
  end

  # Page Report Transaction button helpers #

  # button click filter date on Backoffice
  def button_click_filter_date
    find("#dropdown-box-calendar > div > div > button").click
  end

  # You can fill params[:range] using range box on filter date backoffice, (e.g Today/This Week)
  def change_calendar_range_box(params)
    find("div.col-sm-4.element-non-mobi > div > div > button", text: params[:range]).click
  end

  def search_receipt_number_transaction_report(params)
    fill_in "keyword", :with => params[:keyword]
  end

  def button_click_list_receipt_detail
    find("#transaction-table-list > table > tbody > tr > td:nth-child(3)").click
  end

  def button_done_on_receipt_details
    find("#mk-col-right > div > div:nth-child(3) > button").click
  end

  def get_total_collected_spesific_receipt
    find("div > div:nth-child(2) > div.app-components-receipt-transactions-Summary-__Summary___gqeYT").text
  end

end

World(CheckoutHelper)
