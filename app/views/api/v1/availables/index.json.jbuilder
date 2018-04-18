json.array! @availables do |available|
  json.title "Disponível"
  json.start available.start_time
  json.end available.end_time
  json.id available.id
end
json.array! @bookings do |booking|
  json.title "Contratado por #{booking.user.name}"
  json.start booking.start_time
  json.end booking.end_time
  json.color "red"
  json.id booking.id
end
