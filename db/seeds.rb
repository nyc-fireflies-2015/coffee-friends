User.create(first_name:"Derpson",last_name:"Appuccino", password: "password",
email:"derpson@appuccino.com", phone:"2064326179", picture:Cloudinary::Uploader.upload("http://vignette2.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20100424114324")["public_id"])

User.create(first_name:"Jerry",last_name:"Chai", password: "password",
email:"jchai002@gmail.com", phone:"5107317928", picture: Cloudinary::Uploader.upload("https://avatars3.githubusercontent.com/u/11948171?v=3&s=400")["public_id"])

User.create(first_name:"Travis",last_name:"Allen", password: "password",
email:"travis.william.allen@gmail.com", phone:"3475998150", picture: Cloudinary::Uploader.upload("https://lh4.googleusercontent.com/-ORtfJ8UGvU4/VDRhkx66wgI/AAAAAAAAADE/poe4URxiJvE/s702-no/50402df2-8c88-490d-86ef-b558d035a1ca")["public_id"])

User.create(first_name:"Leah",last_name:"Goldberg", password: "password",
email:"leahgoldberg31@gmail.com", phone:"2064326178", picture: Cloudinary::Uploader.upload("https://lh4.googleusercontent.com/-7EzpM0oSAYc/AAAAAAAAAAI/AAAAAAAAAdw/4T0tiqCAtcQ/photo.jpg")["public_id"])

User.create(first_name:"Kelly",last_name:"Ripple", password: "password",
email:"kelly.m.ripple@gmail.com", phone:"4438122021", picture: Cloudinary::Uploader.upload("https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/2/005/079/3bf/091d5ee.jpg")["public_id"])

25.times do
  n = Faker::Name.first_name
  User.create( first_name: n,
last_name:Faker::Name.last_name,    password: "password",
email:"#{n}#{rand(1000)}@example.com", phone: Random.new.rand(1_000_000_000..9_999_999_999).to_s, picture: Cloudinary::Uploader.upload(Faker::Avatar.image)["public_id"])
end

prices = [2.85, 3.45, 3.95, 3.35, 4.45, 1.75, 2.10, 3.65, 4.65, 2.35]
drinks = ["Americano", "Latte", "Cappuccino", "Macchiato", "Single origin aeropress", "Pour over", "Drip", "Espresso", "Cortado", "Flat white", "Affogato"]

Cafe.create(name: "Bluestone Lane", address: "30 Broad
St, New York, NY 10004", email: "cafe@example.com", password: 'password', borough:"Manhattan",
neighborhood: "FiDi", picture: Cloudinary::Uploader.upload("https://www.bluestonelaneny.com/wp-content/uploads/2014/06/postcard_shop_fidi-740x595.jpg")["public_id"])

Cafe.create(name: "Bedford Hill", address: "343 Franklin Ave,
Brooklyn, NY 11238", email: "cafe25@example.com", password: 'password',
neighborhood: "Bed Stuy", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://www.bedfordhillbrooklyn.com/images/5147932078_23a5479fac_b.jpg")["public_id"])

Cafe.create(name: "Devocion", address: "69 Grand St,
Brooklyn, NY 11249", email: "cafe26@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://bedfordandbowery.com/wp-content/uploads/2014/12/IMG_23651.jpg")["public_id"])

Cafe.create(name: "Budin", address: "114 Greenpoint Ave,
Brooklyn, NY 11222", email: "cafe31@example.com", password: 'password',
neighborhood: "Greenpoint", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://www.shopkeep.com/wp-content/uploads/2014/10/IMG_7523-e1412879270908.jpg")["public_id"])

Cafe.create(name: "Breukelen", address: "764 Franklin Ave,
Brooklyn, NY 11238", email: "cafe32@example.com", password: 'password',
neighborhood: "Crown Heights", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://drinks.seriouseats.com/images/2012/09/SE-bruekelen.jpg")["public_id"])

Cafe.create(name: "66 Hope Street", address: "66 Hope St,
Brooklyn, NY 11211", email: "cafe33@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("https://scontent-lga1-1.xx.fbcdn.net/hphotos-xfa1/t31.0-8/1269303_385221034936843_71467525_o.jpg")["public_id"])

Cafe.create(name: "Ninth Street Espresso", address: "700 E 9th St,
New York, NY 10009", email: "cafe23@example.com", password: 'password', borough:"Manhattan",
neighborhood: "East Village", picture: Cloudinary::Uploader.upload("http://manseekingcoffee.com/wp-content/uploads/2010/02/ninthstreetoutside.jpg")["public_id"])

Cafe.create(name: "Kaffe 1668", address: "275 Greenwich
St, New York, NY 10007", email: "cafe3@example.com", password: 'password', borough:"Manhattan", neighborhood: "Tribeca", picture: Cloudinary::Uploader.upload("http://acdn.architizer.com/mediadata/projects/432009/38d3ff4f.jpg")["public_id"])

Cafe.create(name: "La Colombe Torrefaction", address:
"319 Church St, New York, NY 10013", email: "cafe9@example.com", borough:"Manhattan",password:
'password', neighborhood: "Tribeca", picture: Cloudinary::Uploader.upload("http://www.jinhwafication.com/.a/6a0147e017d0c6970b0147e0d21078970b-pi")["public_id"])

Cafe.create(name: "Abraço Espresso", address: "86 E
7th St, New York, NY 10003", email: "cafe11@example.com", borough:"Manhattan",password:
'password', neighborhood: "East Village", picture: Cloudinary::Uploader.upload("http://www.nycvelo.com/wp-content/uploads/2011/03/abraco3.jpg")["public_id"])

Cafe.create(name: "Gimme! Coffee", address: "228 Mott
St, New York, NY 10012", email: "cafe13@example.com", password: 'password', borough:"Manhattan", neighborhood: "SoHo", picture: Cloudinary::Uploader.upload("http://www.brian-coffee-spot.com/wp-content/uploads/wow-slider-plugin/90/images/dsc_9183a.jpg")["public_id"])

Cafe.create(name: "Bluestockings", address: "172 Allen
St, New York, NY 10002", email: "cafe14@example.com", password: 'password', borough:"Manhattan", neighborhood: "Lower East Side", picture: Cloudinary::Uploader.upload("http://eng31131.pressbooks.com/files/2013/04/P1050762-2.jpg")["public_id"])


Cafe.create(name: "Nectar Coffee Shop", address: "1022
Madison Ave # 1, New York, NY 10075", email: "cafe19@example.com", borough:"Manhattan",password:
'password', neighborhood: "Upper East Side", picture: Cloudinary::Uploader.upload("https://c1.staticflickr.com/3/2862/9406839709_01a8b2d2d9_b.jpg")["public_id"])

Cafe.create(name: "Champignon Cafe", address: "1389
Madison Ave, New York, NY 10029", email: "cafe20@example.com", borough:"Manhattan",password:
'password', neighborhood:"Upper East Side", picture: Cloudinary::Uploader.upload("http://okirakunoa.cocolog-nifty.com/photos/uncategorized/2010/02/23/pc130755.jpg")["public_id"])

Cafe.create(name: "Cafe Grumpy", address: "13 Essex
St, New York, NY 10011", email: "cafe21@example.com", password: 'password', borough:"Manhattan",
neighborhood: "Chinatown", picture: Cloudinary::Uploader.upload("http://35drsm2kcjyo1uhpn73720ja.wpengine.netdna-cdn.com/wp-content/uploads/2008/06/Cafe-Grumpy-Sign.jpg")["public_id"])

Cafe.create(name: "Stumptown", address: "18 W 29th St,
New York, NY 10001", email: "cafe22@example.com", password: 'password', borough:"Manhattan",
neighborhood: "Flatiron", picture: Cloudinary::Uploader.upload("http://media.oregonlive.com/windowshop/photo/stumptown2jpg-423e1f0cf83b5a6d.jpg")["public_id"])

Cafe.create(name: "The Hungry Ghost", address: "183 Sterling Pl,
Brooklyn, NY 11238", email: "cafe24@example.com", password: 'password',
neighborhood: "Prospect Heights", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("https://c1.staticflickr.com/9/8150/7617695438_b6cc62d144_b.jpg")["public_id"])

Cafe.create(name: "Parlour Coffee", address: "84 Havemeyer St,
Brooklyn, NY 11211", email: "cafe27@example.com", password: 'password',
neighborhood: "Williamsburg", borough: "Brooklyn", picture:Cloudinary::Uploader.upload("https://c1.staticflickr.com/9/8071/8346581574_af10d13f22_b.jpg")["public_id"])

Cafe.create(name: "Milk Bar", address: "620 Vanderbilt Ave,
Brooklyn, NY 11238", email: "cafe28@example.com", password: 'password',
neighborhood: "Prospect Heights", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://static1.squarespace.com/static/523760fbe4b0b1ca594cd7d8/523c6dade4b094ec97c93c74/5241d289e4b0c1d14dd7dfe7/1380045451902/milkbar_exterior1_lr.jpg?format=1500w")["public_id"])


Cafe.create(name: "Propeller Coffee", address: "984 Manhattan Ave,
Brooklyn, NY 11222", email: "cafe30@example.com", password: 'password',
neighborhood: "Greenpoint", borough: "Brooklyn", picture: Cloudinary::Uploader.upload("http://onthegrid4.imgix.net/Z-2-3.jpg?auto=format,redeye&dpr=2&w=1129")["public_id"])

Cafe.create(name: "Sweetleaf", address: "10-93 Jackson Ave,
Queens, NY 11101", email: "cafe34@example.com", password: 'password',
neighborhood: "Long Island City", borough: "Queens", picture: Cloudinary::Uploader.upload("http://www.eatthisny.com/wp-content/uploads/2014/04/IMG_1613.jpg")["public_id"])

Cafe.create(name: "Astoria Coffee", address: "30-04 30th St,
Queens, NY 11102", email: "cafe35@example.com", password: 'password',
neighborhood: "Astoria", borough: "Queens", picture: Cloudinary::Uploader.upload("http://s3-media3.fl.yelpcdn.com/bphoto/-jdWMRinwS7hCmWlF_XXwg/o.jpg")["public_id"])

Cafe.create(name: "Moss Cafe", address: "3260 Johnson Ave,
Bronx, NY 10463", email: "cafe36@example.com", password: 'password',
neighborhood: "Riverdale", borough: "The Bronx", picture: Cloudinary::Uploader.upload("https://scontent-lga1-1.xx.fbcdn.net/hphotos-xfa1/t31.0-8/11169584_795334743916762_7907992062062776884_o.jpg")["public_id"])

Cafe.all.each do |c|
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






