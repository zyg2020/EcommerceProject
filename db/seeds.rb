# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

csv_file = Rails.root.join("db/dataset_excel.csv")
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |p|
  print p
end

Pages
Category
Province
Customer
Status
Order
Product
OrderProduct
ProductCategory
