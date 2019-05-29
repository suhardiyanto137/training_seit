Then(/^I should see F&B image & information$/) do
 page.should have_content("Cocok untuk restoran cepat saji, food truck, bakery, dan lainnya.")
 expect(page).to have_css("img[src='https://www.mokapos.com/assets/home/fnb-939cf3589a07aa16073b634a5ba76767.png']")
end

Given(/^click button video F&B$/) do
 find("h5>a:nth-child(1)[data-thevideo='https://www.youtube.com/embed/ZMv1ai3goGg']").click
end

Then(/^I should see Service Business image and information$/) do
 page.should have_content("Cocok untuk barbershop, salon
 kecantikan, spa & refleksi, dan lainnya.")
 expect(page).to have_css("img[src='https://www.mokapos.com/assets/home/barbershop-9ed215ab82f0c5cc21a1e373b4de52a7.png']")
end

Given(/^click button video Service Business$/) do
 find("h5>a:nth-child(1)[data-thevideo='https://www.youtube.com/embed/jJyDCB8dZIY']").click
end

Then(/^I should see Retail image and information$/) do
 page.should have_content("Cocok untuk toko baju, toko buku, bazaar, dan lainnya.")
 expect(page).to have_css("img[src='https://www.mokapos.com/assets/home/retail-10f61ab249124ff31e9008a70877586c.png']")
end

Given(/^click button video Retail$/) do
 find("h5>a:nth-child(1)[data-thevideo='https://www.youtube.com/embed/HmBAPEiows0']").click
end
