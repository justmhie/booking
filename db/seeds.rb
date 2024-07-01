aly = User.create!(
  first_name: "Aly",
  last_name: "Mhie",
  email: "aly@example.com",
  mobile_number: "1234567890",
  password: "password",
  password_confirmation: "password"
)

kim = User.create!(
  first_name: "Kim",
  last_name: "Ralp",
  email: "kim@example.com",
  mobile_number: "2134567890",
  password: "confirmation",
  password_confirmation: "confirmation"
)


admin_role = UserRole.create!(role: 'admin', user: aly)
customer_role = UserRole.create!(role: 'customer', user: kim)
