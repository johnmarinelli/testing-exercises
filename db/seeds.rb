# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

query1 = Query.create(hour: 19, category: "JBIZ", location_country: "USA", price_max: 100, user_id: 8)
query1 = Query.create(hour: 19, category: "APET", location_country: "USA", price_max: 200, user_id: 8)
