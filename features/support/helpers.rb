require_relative 'helpers/global_helper'
require_relative 'helpers/automation_helper'
require_relative 'helpers/wait_for_ajax_helper'
require_relative 'helpers/checkout_helper'
require_relative 'helpers/tax_library_helper'
require_relative 'helpers/create_tax_singleoutlet'

module Helper
  include AutomationHelper
  include CustomWorld
  include WaitForAjax
  include CheckoutHelper
  include TaxLibrary
  include CreateTaxSingleOutlet
end

World(Helper)
