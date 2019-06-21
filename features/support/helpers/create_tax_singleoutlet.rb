module CreateTaxSingleOutlet

  def create_tax_single_outlet
    click_button_create_tax
    fill_tax_name(param[:tax_name])
    fill_tax_amount(param[:tax_amount])
    click_save_tax
  end
end
