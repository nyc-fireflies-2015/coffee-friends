# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(first_name:"Derpson",last_name:"Lastname", password: "password", email:"user@example.com", phone:"1231231234")

10.times {FactoryGirl.create(:user)}

c = Cafe.create(name: "Bluestone Lane", address: "30 Broad St, New York, NY 10004", email: "cafe@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Starbucks", address: "55 Broad St, New York, NY 10004", email: "cafe2@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Kaffe 1668", address: "275 Greenwich St, New York, NY 10007", email: "cafe3@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Gregorys Coffee", address: "100 Wall St, New York, NY 10005", email: "cafe4@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Blue Spoon Coffee Company", address: "90 William St, New York, NY 10038", email: "cafe5@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Laughing Man Coffee & Tea", address: "184 Duane St, New York, NY 10013", email: "cafe6@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "The Coffee Bean & Tea Leaf", address: "22 Cortlandt St, New York, NY 10007", email: "cafe7@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Inatteso Cafe Casano", address: "30 West St, New York, NY 10004", email: "cafe8@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "La Colombe Torrefaction", address: "319 Church St, New York, NY 10013", email: "cafe9@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Cafe Grumpy", address: "13 Essex St, New York, NY 10011", email: "cafe10@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Les Enfants de Bohème", address: "177 Henry St, New York, NY 10002", email: "cafe10@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Abraço Espresso", address: "86 E 7th St, New York, NY 10003", email: "cafe11@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Mudspot", address: "307 E 9th St, New York, NY 10003", email: "cafe12@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Gimme! Coffee", address: "228 Mott St, New York, NY 10012", email: "cafe13@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Bluestockings", address: "172 Allen St, New York, NY 10002", email: "cafe14@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Paradiso", address: "105 Avenue B, New York, NY 10009", email: "cafe15@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Cafe Green", address: "377 1st Avenue, New York, NY 10010", email: "cafe16@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "The Grey Dog", address: "242 W 16th St, New York, NY 10011", email: "cafe17@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Kahve", address: "774 Ninth Ave, New York, NY 10019", email: "cafe18@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Nectar Coffee Shop", address: "1022 Madison Ave # 1, New York, NY 10075", email: "cafe19@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Cafe.create(name: "Champignon Cafe", address: "1389 Madison Ave, New York, NY 10029", email: "cafe20@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }








