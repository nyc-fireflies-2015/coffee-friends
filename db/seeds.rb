User.create(first_name:"Derpson",last_name:"Appuccino", password: "password",
email:"derpson@appuccino.com", phone:"2064326178")

25.times {User.create( first_name: Faker::Name.first_name,
last_name:Faker::Name.last_name,    password: "password",
email:Faker::Internet.email, phone: Random.new.rand(1_000_000_000..9_999_999_999).to_s, picture: Faker::Avatar.image)}

prices = [2.85, 3.45, 3.95, 3.35, 4.45, 1.75, 2.10, 3.65, 4.65, 2.35]
drinks = ["Americano", "Latte", "Cappuccino", "Macchiato", "Single origin aeropress", "Pour over", "Drip", "Espresso", "Cortado", "Flat white", "Affogato"]

Cafe.create(name: "Bluestone Lane", address: "30 Broad
St, New York, NY 10004", email: "cafe@example.com", password: 'password', borough:"Manhattan",
neighborhood: "FiDi")

Cafe.create(name: "Bedford Hill", address: "343 Franklin Ave,
Brooklyn, NY 11238", email: "cafe25@example.com", password: 'password',
neighborhood: "Bed Stuy", borough: "Brooklyn")

Cafe.create(name: "Devocion", address: "69 Grand St,
Brooklyn, NY 11249", email: "cafe26@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn")

Cafe.create(name: "Budin", address: "114 Greenpoint Ave,
Brooklyn, NY 11222", email: "cafe31@example.com", password: 'password',
neighborhood: "Greenpoint", borough: "Brooklyn")

Cafe.create(name: "Breukelen", address: "764 Franklin Ave,
Brooklyn, NY 11238", email: "cafe32@example.com", password: 'password',
neighborhood: "Crown Heights", borough: "Brooklyn")

Cafe.create(name: "66 Hope Street", address: "66 Hope St,
Brooklyn, NY 11211", email: "cafe33@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn")

Cafe.create(name: "Ninth Street Espresso", address: "700 E 9th St,
New York, NY 10009", email: "cafe23@example.com", password: 'password', borough:"Manhattan",
neighborhood: "East Village")

Cafe.create(name: "Kaffe 1668", address: "275 Greenwich
St, New York, NY 10007", email: "cafe3@example.com", password: 'password', borough:"Manhattan", neighborhood: "Tribeca")

Cafe.create(name: "La Colombe Torrefaction", address:
"319 Church St, New York, NY 10013", email: "cafe9@example.com", borough:"Manhattan",password:
'password', neighborhood: "Tribeca")

Cafe.create(name: "Abraço Espresso", address: "86 E
7th St, New York, NY 10003", email: "cafe11@example.com", borough:"Manhattan",password:
'password', neighborhood: "East Village")

Cafe.create(name: "Gimme! Coffee", address: "228 Mott
St, New York, NY 10012", email: "cafe13@example.com", password: 'password', borough:"Manhattan", neighborhood: "SoHo")

Cafe.create(name: "Bluestockings", address: "172 Allen
St, New York, NY 10002", email: "cafe14@example.com", password: 'password', borough:"Manhattan", neighborhood: "Lower East Side")

Cafe.create(name: "Paradiso", address: "105 Avenue B,
New York, NY 10009", email: "cafe15@example.com", password: 'password', borough:"Manhattan", neighborhood: "East Village")

Cafe.create(name: "Nectar Coffee Shop", address: "1022
Madison Ave # 1, New York, NY 10075", email: "cafe19@example.com", borough:"Manhattan",password:
'password', neighborhood: "Upper East Side")

Cafe.create(name: "Champignon Cafe", address: "1389
Madison Ave, New York, NY 10029", email: "cafe20@example.com", borough:"Manhattan",password:
'password', neighborhood:"Upper East Side")

Cafe.create(name: "Cafe Grumpy", address: "13 Essex
St, New York, NY 10011", email: "cafe21@example.com", password: 'password', borough:"Manhattan",
neighborhood: "Chinatown")

Cafe.create(name: "Stumptown", address: "18 W 29th St,
New York, NY 10001", email: "cafe22@example.com", password: 'password', borough:"Manhattan",
neighborhood: "Flatiron")

Cafe.create(name: "The Hungry Ghost", address: "183 Sterling Pl,
Brooklyn, NY 11238", email: "cafe24@example.com", password: 'password',
neighborhood: "Prospect Heights", borough: "Brooklyn")

Cafe.create(name: "Parlour Coffee", address: "84 Havemeyer St,
Brooklyn, NY 11211", email: "cafe27@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn")

Cafe.create(name: "Milk Bar", address: "620 Vanderbilt Ave,
Brooklyn, NY 11238", email: "cafe28@example.com", password: 'password',
neighborhood: "Prospect Heights", borough: "Brooklyn")

Cafe.create(name: "Milk Bar", address: "620 Vanderbilt Ave,
Brooklyn, NY 11238", email: "cafe29@example.com", password: 'password',
neighborhood: "Prospect Heights", borough: "Brooklyn")

Cafe.create(name: "Propeller Coffee", address: "984 Manhattan Ave,
Brooklyn, NY 11222", email: "cafe30@example.com", password: 'password',
neighborhood: "Greenpoint", borough: "Brooklyn")

Cafe.create(name: "Sweetleaf", address: "10-93 Jackson Ave,
Queens, NY 11101", email: "cafe34@example.com", password: 'password',
neighborhood: "Long Island City", borough: "Queens")

Cafe.create(name: "Astoria Coffee", address: "30-04 30th St,
Queens, NY 11102", email: "cafe35@example.com", password: 'password',
neighborhood: "Astoria", borough: "Queens")

Cafe.create(name: "Moss Cafe", address: "3260 Johnson Ave,
Bronx, NY 10463", email: "cafe36@example.com", password: 'password',
neighborhood: "Riverdale", borough: "The Bronx")

Cafe.all.each do |c|
  #this will upload to cloudinary every  time we seed. don't use while developing
  # c.picture = File.open(Rails.root + "app/assets/images/cafe.jpg")
  # c.save!
	(2..7).to_a.sample.times do
		drinks = drinks.dup.shuffle
		c.menu_items.create(name: drinks.pop, price: prices.sample)
	end
end

User.all.each do |u|
  (2..7).to_a.sample.times do
    # redeemed
    u.redeemed_coffee_gifts.create(giver: User.all.sample, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: true)
    # unredeemed
    u.unredeemed_coffee_gifts.create(giver: User.all.sample, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: false)
    # redeemed sent
    User.all.sample.redeemed_coffee_gifts.create(giver: u, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: true)
    # unredeemed sent
    User.all.sample.redeemed_coffee_gifts.create(giver: u, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: false)
  end
end








