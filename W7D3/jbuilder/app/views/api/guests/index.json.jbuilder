json.array! @guests do |guest|
  json.partial! 'guest', cat: guest if guest.age < 50 && guest.age > 40 
end
