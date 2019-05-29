Then(/^I should see Dipercaya lebih dari (\d+),(\d+) pebisnis di seluruh Indonesia$/) do |arg1, arg2|
  page.should have_content('Dipercaya lebih dari 12,000 pebisnis di seluruh Indonesia')
end

When(/^I click play button at one of testimonials$/) do
  evaluate_script("$('div.carousel-item.Slide__slide__sclon:nth-child(1) > a > div.Slide__play-button__2OPpA').click()")
end

Then(/^I should see testimonial video$/) do
  within_frame(find('div > div > iframe')) do
    sleep 3
    find("div.html5-video-player").click
    sleep 7
  end
  execute_script("$('.close.VideoModal__close__3axkA').click()")
  sleep 3
end

When(/^I click carousel button > next arrow$/) do
  find("li.jsx-3646531296:nth-child(1)").click
  sleep 3
  find("a.carousel-control-next.Arrows__arrow__1l2VZ").click
end

Then(/^I should see next slide$/) do
  expect(page).to have_css("div.carousel-item.Slide__slide__sclon.active > div > div > div.Slide__header__MlqPs > p", text: "Moka sangat mudah dioperasikan, entah itu untuk pegawai baru atau untuk outlet baru. Saya bisa memantau 12 toko sekaligus tanpa harus berada di sana.")
end

When(/^I click carousel button > prev arrow$/) do
  find("li.jsx-3646531296:nth-child(1)").click
  sleep 3
  find("a.carousel-control-prev.Arrows__arrow__1l2VZ").click
end

Then(/^I should see prev slide$/) do
  expect(page).to have_css("div.carousel-item.Slide__slide__sclon.active > div > div > div.Slide__header__MlqPs > p", text:"Moka datanya cloud jadi bisa diakses di mana saja dan kita bisa pantau bisnis dari mulai omset, stok, sampai barang yang efisien dan tidaknya.")
end
