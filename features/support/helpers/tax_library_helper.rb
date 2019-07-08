module TaxLibrary

  def access_tax
    visit "/library/taxes"
    top_loading_bar
    page.should have_content('Taxes')
  end


  def click_button_create_tax
    click_button "Create Tax"
  end


  def fill_tax_name(param)
    fill_in "name", :with => param
  end

  def fill_tax_amount(param)
    find("div:nth-child(2) > div > div > input").send_keys(param)
  end


  def click_save_tax
    find("span > button:nth-child(3)").click
    top_loading_bar
  end


  def check_tax_list(param)
    expect(page).to have_css("table > tbody > tr:nth-child(1) > td:nth-child(1)", :text => param)
  end


  def clear_tax(param)
    find("table > tbody > tr > td:nth-child(1)", :text => param).click
    top_loading_bar
    find(".fa.fa-trash").click
    find("div > button.btn.btn-danger").click
    top_loading_bar
    expect(page).to have_content("Taxes successfully deleted.")
  end
end
