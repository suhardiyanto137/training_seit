@javascript
Feature:
    Check Moka POS navbar

Background:
    Given I go to mokapos homepage


        Scenario: Make sure I can access Blog page
                  When I click link Blog
                  Then I should be redirected to Blog page "https://blog.mokapos.com/"
        Scenario: Make sure I can access Bantuan pages
                  When I click link Bantuan
                  Then I should see Pusat Bantuan Moka POS page
                  
        Scenario: Make sure I can access Moka > Login
                  When I click link Login
                  Then I should see Sign In page
                  And make sure page directed to "https://backoffice-staging.mokapos.com/login"
        Scenario: Make sure I can access Moka > Coba Gratis
                  When I click link Coba Gratis
                  Then I should see register page
                  And make sure page directed to "https://backoffice-staging.mokapos.com/register"

        Scenario: Make sure  homepage has Moka Logo
                  Then I should see Moka logo
        Scenario: Make sure I can access Moka > Point of Sales > Rangkuman Fitur
                  When I click dropdown Point of Sales
                  And I click Rangkuman Fitur
                  Then I should see Moka Point of Sale
        Scenario: Make sure I can access Moka > Point of Sales > Manajemen Meja
                  When I click dropdown Point of Sales
                  And I click Manajemen Meja
                  Then I should see Table Management
        Scenario: Make sure I can access Moka > Point of Sales > Manajemen Inventori
                  When I click dropdown Point of Sales
                  And I click Manajemen Inventori
                  Then I should see Track Your Ingredient Inventory
        Scenario: Make sure I can access Moka > Point of Sales > Manajemen Staff
                  When I click dropdown Point of Sales
                  And I click Manajemen Staff
                  Then I should see Moka Point of Sale
        Scenario: Make sure I can access Moka > Point of Sales > Manajemen Pelanggan
                  When I click dropdown Point of Sales
                  And I click Manajemen Pelanggan
                  Then I should see Know Your Customers

        Scenario: Make sure I can access Moka > Payment
                  And I click link Payment
                  Then I should see Moka Payments
        Scenario: Make sure I can access Moka > Capital
                  And I click link Capital
                  Then I should see Moka Capital

        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Kedai Kopi
                  When I click dropdown Lainnya
                  And I click link Kedai Kopi
                  Then I should see Moka untuk Bisnis Kedai Kopi
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Restoran
                  When I click dropdown Lainnya
                  And I click link Restoran
                  Then I should see Moka untuk Bisnis Restoran
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Restoran Cepat Saji
                  When I click dropdown Lainnya
                  And I click link Restoran Cepat Saji
                  Then I should see Moka untuk Bisnis Restoran Cepat Saji
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Toko Roti
                  When I click dropdown Lainnya
                  And I click link Toko Roti
                  Then I should see Moka untuk Bisnis Toko Roti
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Retail
                  When I click dropdown Lainnya
                  And I click link Retail
                  Then I should see Moka untuk Bisnis Retail
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Minimarket
                  When I click dropdown Lainnya
                  And I click link Minimarket
                  Then I should see Moka untuk Bisnis Minimarket
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Barbershop & Salon
                  When I click dropdown Lainnya
                  And I click link Barbershop & Salon
                  Then I should see Moka untuk Bisnis Barbershop & Salon
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Layanan Kecantikan
                  When I click dropdown Lainnya
                  And I click link Layanan Kecantikan
                  Then I should see Moka untuk Bisnis Layanan Kecantikan
        Scenario: Make sure I can access Moka > Lainnya > Solusi Bisnis > Layanan Profesional
                  When I click dropdown Lainnya
                  And I click link Layanan Profesional
                  Then I should see Moka untuk Bisnis Layanan Profesional

        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Harga
                  When I click dropdown Lainnya
                  And I click link Harga
                  Then I should see Harga Moka POS
        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Hubungi Kami
                  When I click dropdown Lainnya
                  And I click link Hubungi Kami
                  Then I should see Contact Us
        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Support Center
                  When I click dropdown Lainnya
                  And I click link Support Center
                  Then I should see Butuh Bantuan?
        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Video Tutorials
                  When I click dropdown Lainnya
                  And I click link Video Tutorials
                  Then I should see Moka POS - Aplikasi Kasir Point of Sale
        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Knowledge Center
                  When I click dropdown Lainnya
                  And I click link Knowledge Center
                  Then I should see Selamat datang di Pusat Bantuan Moka POS
        Scenario: Make sure I can access Moka > Lainnya > Bantuan > Panduan Penggunaan
                  When I click dropdown Lainnya
                  And I click link Panduan Penggunaan
                  Then I should see Selamat datang di Pusat Bantuan Moka POS

        Scenario: Make sure I can access Moka > Lainnya > Open Platform > Developers
                  When I click dropdown Lainnya
                  And I click link Developers
                  Then I should see Let's grow together by building on Moka Open Platform
        Scenario: Make sure I can access Moka > Lainnya > Open Platform > Getting Started
                  When I click dropdown Lainnya
                  And I click link Getting Started
                  Then I should see Start building with Moka in 3 easy steps.
        Scenario: Make sure I can access Moka > Lainnya > Open Platform > API Reference
                  When I click dropdown Lainnya
                  And I click link API Reference
                  Then I should see MOKA API page
        Scenario: Make sure I can access Moka > Lainnya > Open Platform > Developer Terms
                  When I click dropdown Lainnya
                  And I click link Developer Terms
                  Then I should see Developer Terms of Service

        Scenario: Make sure I can access Moka > Lainnya > Tentang Moka > Informasi Moka
                  When I click dropdown Lainnya
                  And I click link Informasi Moka
                  Then I should see Tentang Moka POS
        Scenario: Make sure I can access Moka > Lainnya > Tentang Moka > Berita
                  When I click dropdown Lainnya
                  And I click link Berita
                  Then I should see MOKABlog
        Scenario: Make sure I can access Moka > Lainnya > Tentang Moka > Blog
                  When I click dropdown Lainnya
                  And I click link Blogg
                  Then I should see MOKABlog
        Scenario: Make sure I can access Moka > Lainnya > Tentang Moka > Karir
                  When I click dropdown Lainnya
                  And I click link Karir
                  Then I should see Job Openings at Moka
