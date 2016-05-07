require 'faker'


User.create(username: "tom", password: "tomtom", password_confirmation: "tomtom", email: "tom@tom.com")
User.create(username: "tim", password: "timtim", password_confirmation: "timtim", email: "tim@tim.com", admin: true)


10.times do
  Category.create(  name: Faker::Hipster.word )
end


30.times do
  product = Product.create(
                name: Faker::Commerce.product_name,
                description: Faker::Hipster.paragraph,
                price: Faker::Commerce.price,
                # url: Faker::Avatar.image,
                stock: rand(15)+1 )
  categories = Category.all.sample(rand(10)).uniq
  categories.each do |c|
    product.categories_products.create(category_id: c.id)
  end
end