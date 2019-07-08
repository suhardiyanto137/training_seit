module LibraryHelper
  def create_item_for_checkout(param)
      click_button 'Create Item'
      top_loading_bar
      fill_in 'name', :with => param[:item_name]
      find("div.mk-grouped-input > div:nth-child(1) > div > input").set param[:item_price]
      find("span > button:nth-child(3)").click
      top_loading_bar
      find('button', text: "Cancel").click
  end
end

World(LibraryHelper)
