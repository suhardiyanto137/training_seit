Then(/^I should see Atur kasir lebih mudah dengan Moka POS and Kami membantu bisnis Anda mempercepat proses penjualan dengan aplikasi kasir Moka$/) do
  page.should have_content('Atur kasir lebih mudah dengan Moka POS')
end

When(/^I click Coba Gratis Sekarang$/) do
  find("#mpIndexRegister1").click
end

Then(/^I should see register page$/) do
  page.should have_content('Start your free 14-day trial now.')
end

When(/^I click play button Tonton Video Kami$/) do
  find("div.Jumbotron__jumbotron__26wSR > div > button").click
end

Then(/^I should see Moka's video$/) do
  within_frame(find('div > div > iframe')) do
    sleep 3
    find('div.html5-video-player').click
    sleep 7
  end
  execute_script("$('.close.VideoModal__close__3axkA').click()")
  sleep 3
end
