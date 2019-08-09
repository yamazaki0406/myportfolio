User.create!(name:  "山崎　聡之",
             email: "b.baller-toshi.1st@ezweb.ne.jp",
             password:              "aaaaaa",
             password_confirmation: "aaaaaa",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
