json.array! @availables do |available|
  json.title "Disponível"
  json.start available.start_time
  json.end available.end_time
end
json.array! @bookings do |booking|
  json.title "Contratado por #{booking.user.name}"
  json.start booking.start_time
  json.end booking.end_time
  json.color "red"
end
