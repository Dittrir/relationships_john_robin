# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plumbershop.destroy_all
Plumber.destroy_all
@shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
@plumber_1 = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
@plumber_2 = @shop.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)

Autoshop.destroy_all
Vehicle.destroy_all
@shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
@shop_2 = Autoshop.create!(name: "Heavy Metal Auto Repair", open: true, vehicles_in_shop: 8)
@vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
@vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
@vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
@vehicle_4 = @shop_2.vehicles.create!(name: 'Toyota Tacoma', need_repair: true, repair_cost: 1200, autoshop_id: @shop_1.id)
@vehicle_5 = @shop_2.vehicles.create!(name: 'Honda CRV', need_repair: true, repair_cost: 500, autoshop_id: @shop_1.id)

