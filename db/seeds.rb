# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

ProductCategory.delete_all
OrderProduct.delete_all
Product.delete_all
Order.delete_all
Status.delete_all
Customer.delete_all
Province.delete_all
Category.delete_all
Page.delete_all

csv_file = Rails.root.join("db/dataset_excel.csv")
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |p|
  product = Product.create(name:           p["name"],
                           description:    p["description"],
                           previous_price: p["previous_price"],
                           price:          p["price"])
  if product&.valid?
    categories = p["category"].split(",").map(&:strip)
    categories.each do |category_name|
      category = Category.find_or_create_by(name: category_name)
      ProductCategory.create(product: product, category: category)
    end
  else
    puts "Invalid product #{p['name']}"
  end
end

Page.create(
  title:     "About the Data",
  content:   "The data powering this website was provided by an IMDB Kaggle dataset.",
  permalink: "about_the_data"
)
Page.create(
  title:     "Contact Us",
  content:   "If you like this site and want to chat about the project or the data, email me at: obviously_fake@email.com",
  permalink: "contact"
)

puts "Created #{Page.count} Pages"
puts "Created #{Product.count} Products"
puts "Created #{Category.count} Categories"
