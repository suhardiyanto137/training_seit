module WaitForAjax
  def finished_all_ajax_requests?
    begin
      jquery = page.evaluate_script('jQuery.active')
    end while jquery == '0'
  end

  # def wait_for_ajax
  #   Timeout.timeout(Capybara.default_max_wait_time) do
  #     loop until finished_all_ajax_requests?
  #   end
  # end
end
