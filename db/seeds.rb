User.create(name: "Vikram Chilkunda", idnum: "999998", mobilenum: "9999999998", password: "999998", password_confirmation: "999998", admin: "true")
User.create(name: "John Pehar", idnum: "999999", mobilenum: "9999999999", password: "999999", password_confirmation: "999999", admin: "true")


Bus.create(busnum: 1)
Bus.create(busnum: 2)
Bus.create(busnum: 3)
Bus.create(busnum: 4)
Bus.create(busnum: 5)
Bus.create(busnum: 6)
Bus.create(busnum: 7)
Bus.create(busnum: 8)

i = 1
while i < 9
  41.times do |n|
   seatnum = n+1
   bus_id = i
   Seat.create(seatnum: seatnum, bus_id: bus_id, user_id: nil)
  end
  i += 1
end

# a = 0
# while a < 10
#     str = "Post " + (1+a).to_s
#     Post.create(title: str, content: "This is an auto generated post")
#     a += 1
# end