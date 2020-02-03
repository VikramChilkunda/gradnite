User.create!(name: "Example User",
            idnum: "123456",
            mobilenum: "1231231234",
            admin: true)

99.times do |n|
    name = Faker::Name.name
    idnum = (rand 111111...999999).to_s
    mobilenum = (rand 1111111111...9999999999).to_s
    User.create!(name: name,
                idnum: idnum,
                mobilenum: mobilenum)
end