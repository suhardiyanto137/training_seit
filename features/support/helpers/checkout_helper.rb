World(ShowMeTheCookies)
module CheckoutHelper

  def get_api_spesific_item
    @cookie = get_me_the_cookie ('remember_token')
    param= {
      "page": 0,
      "category_id": "",
      "inventory": "all",
      "outlet_id": "9084",
      "keyword": "#{@param[:item_name]}",
      "is_mobile": "false"
    }
    item_params = Curl.get("https://service-dev.mokapos.com/inventory/v1/items", param) do |curl|
      curl.headers['Content-Type'] = 'application/json'
      curl.headers['Accept'] = "application/json"
      curl.headers['Authorization'] = "#{@cookie[:value]}"
      curl.headers['User-Agent'] = 'capybara'
      curl.headers['OUTLET_ID'] = "9084"
      curl.headers['OUTLET_IDS'] = "8781,11532,9084"
    end
    JSON.parse(item_params.body)
  end

  def create_basic_checkout_transaction
    @year = Time.now.year
    @month = Time.now.month
    @day = Time.now.day
    @hour = Time.now.hour
    @min = Time.now.min
    @sec = Time.now.sec
    # For receipt number randomize
    receipt_number_randomize = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(3).join

    @checkout_params = { "checkout": {
      "total_collected": "#{@item_price}",
      "subtotal": "#{@item_price}",
        "items": [
          {
            "item_name": "#{@item_name}",
            "tax": "0",
            "category_name": "Drink",
            "client_price": "#{@item_price}",
            "discount_amount": "0",
            "item_variant_sku": "",
            "order_status": "New Order",
            "sales_type_id": 2561,
            "net_sales": "#{@item_price}",
            "quantity": "1",
            "gratuity": "0",
            "sales_type_name": "Delivery Order",
            "item_variant_name": "",
            "is_program_item": false,
            "item_id": @item_id,
            "item_variant_id": @item_variant_id,
            "track_stock": false,
            "gross_sales": "#{@item_price}",
            "category_id": @item_category_id
          }
        ],
        "customer_uniq_id": "0",
        "customer_id": "71854",
        "customer_name": ".Suhas",
        "enable_gratuity": false,
        "is_offline": false,
        "client_created_at": "#{@year}-#{@month}-#{@day}T#{@hour}:#{@min}:#{@sec}.110847+07:00",
        "transaction_date": "#{@year}-#{@month}-#{@day}T#{@hour}:#{@min}:#{@sec}.186080+07:00",
        "amount_pay": "50000",
        "include_tax_and_gratuity": false,
        "total_gross_sales": "#{@item_price}",
        "total_net_sales": "#{@item_price}",
        "uniq_id": 1,
        "is_loyalty": false,
        "total_gratuity": "0",
        "is_sales_type": true,
        "payment_type": "cash",
        "enable_tax": false,
        "total_discount": "0",
        "receipt_number": "SHA#{receipt_number_randomize}",
        "total_tax": "0",
        "is_refund_transaction": false,
        "customer_email": "suha@mailinator.com",
        "customer_phone": "+6285868582137"
      }
    }

    @cookie = get_me_the_cookie('remember_token')
    http = Curl.post("https://dev-old.mokapos.com/api/v2/checkouts", @checkout_params.to_json) do |http|
      http.headers['Accept'] = 'application/json'
      http.headers['Content-Type'] = 'application/json'
      http.headers['Cookie'] = "remember_token=#{@cookie[:value]}"
      http.headers['User-Agent'] = 'capybara'
      http.headers['OUTLET_ID'] = "9084"
      http.headers['OUTLET_IDS'] = "8781,11532,9084"
    end

    JSON.parse(http.body)
  end
end
