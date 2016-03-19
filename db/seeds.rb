# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hvalue = ActiveSupport::JSON.decode(File.read('db/160319_hvalue_hokkaido_kana.json'))
hvalue.each do |data|
  Hvalue.create(data)
end

japan = ActiveSupport::JSON.decode(File.read('db/japan_codes2.json'))
japan.each do |data|
  Japan.create(data)
end

hcontact = ActiveSupport::JSON.decode(File.read('db/160314_hcontact_dummy_h180.json'))
hcontact.each do |data|
  Hcontact.create(data)
end