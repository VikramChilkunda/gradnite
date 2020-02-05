# User.create!(name: "Example User",
#             idnum: "123456",
#             mobilenum: "1231231234",
#             admin: true)
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

# 99.times do |n|
#     name = Faker::Name.name
#     idnum = (rand 111111...999999).to_s
#     mobilenum = (rand 1111111111...9999999999).to_s
#     User.create!(name: name,
#                 idnum: idnum,
#                 mobilenum: mobilenum)
# end