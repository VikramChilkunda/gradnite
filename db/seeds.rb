User.create!(name: "Example User",
            idnum: "123456",
            mobilenum: "1231231234",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true)

99.times do |n|
    name = Faker::Name.name
    idnum = (rand 111111...999999).to_s
    mobilenum = (rand 1111111111...9999999999).to_s
    password = "password"
    User.create!(name: name,
                idnum: idnum,
                mobilenum: mobilenum,
                password: password,
                password_confirmation: password)
end