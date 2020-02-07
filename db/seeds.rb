User.create(name: "Vikram Chilkunda", idnum: "419419", mobilenum: "7472298734", password: "419419", password_confirmation: "419419", admin: "true")
User.create(name: "John Pehar", idnum: "111111", mobilenum: "1111111111", password: "111111", password_confirmation: "111111", admin: "true")
# 99.times do |n|
#     name = Faker::Name.name
#     idnum = (rand 111111...999999).to_s
#     mobilenum = (rand 1111111111...9999999999).to_s
#     User.create!(name: name,
#                 idnum: idnum,
#                 mobilenum: mobilenum,
#                 password: idnum,
#                 password_confirmation: idnum)
# end

Bus.create(busnum: 1)
Bus.create(busnum: 2)
Bus.create(busnum: 3)
Bus.create(busnum: 4)
Bus.create(busnum: 5)
Bus.create(busnum: 6)
Bus.create(busnum: 7)
Bus.create(busnum: 8)

i = 0
while i < 9
  42.times do |n|
   seatnum = n
   bus_id = i
   Seat.create(seatnum: seatnum, bus_id: bus_id)
  end
  i += 1
end

# a = 0
# while a < 10
#     str = "Post " + (1+a).to_s
#     Post.create(title: str, content: "This is an auto generated post")
#     a += 1
# end