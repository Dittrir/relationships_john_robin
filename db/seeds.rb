# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@shop_1 = Autoshop.create!(id: 1, name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
@vehicle_1 = Vehicle.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500)
@vehicle_2 = Vehicle.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800)
@vehicle_3 = Vehicle.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0)
