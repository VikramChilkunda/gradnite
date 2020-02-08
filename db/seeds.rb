User.create(name: "Vikram Chilkunda", idnum: "999998", mobilenum: "9999999998", password: "999998", password_confirmation: "999998", admin: "true")
User.create(name: "John Pehar", idnum: "999999", mobilenum: "9999999999", password: "999999", password_confirmation: "999999", admin: "true")

328.times do |n|
    name = Faker::Name.name
    idnum = (rand 111111...999997).to_s
    mobilenum = (rand 1111111111...9999999997).to_s
    User.create!(name: name,
                idnum: idnum,
                mobilenum: mobilenum,
                password: idnum,
                password_confirmation: idnum)
end

Bus.create(busnum: 1)
Bus.create(busnum: 2)
Bus.create(busnum: 3)
Bus.create(busnum: 4)
Bus.create(busnum: 5)
Bus.create(busnum: 6)
Bus.create(busnum: 7)
Bus.create(busnum: 8)

i = 1
userCount = 3
while i < 9
  41.times do |n|
   seatnum = n+1
   user_id = User.find(userCount)[:idnum]
   bus_id = i
   if(n == 40)
        Seat.create(seatnum: seatnum, bus_id: bus_id, user_id: nil)
   else
        Seat.create(seatnum: seatnum, bus_id: bus_id, user_id: user_id)
   end
   User.find_by(idnum: user_id).update_attribute(:busnum, bus_id)
   User.find_by(idnum: user_id).update_attribute(:seatnum, seatnum)
   userCount += 1
  end
  i += 1
end

# a = 0
# while a < 10
#     str = "Post " + (1+a).to_s
#     Post.create(title: str, content: "This is an auto generated post")
#     a += 1
# end