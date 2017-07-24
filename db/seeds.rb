User.create(
  name: "Alice Walker",
  email: "alice@example.com",
  password: "secret"
)

16.times do
  Product.create(name: Faker::Hipster.words(2).map(&:titlecase).join(" "))
end
