require_relative 'helpers/global_helper'
require_relative 'helpers/automation_helper'
require_relative 'helpers/wait_for_ajax_helper'
require_relative 'helpers/checkout_helper'

module Helper
  include AutomationHelper
  include CustomWorld
  include WaitForAjax
  include CheckoutHelper
end

World(Helper)
