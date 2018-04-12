json.array! @availables do |available|
  json.title "Disponível"
  json.start available.start_time
  json.end available.end_time
end
