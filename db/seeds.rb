# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hvalue = ActiveSupport::JSON.decode(File.read('db/160306_hvalue_for_demo_sagyoutyuu.json'))
hvalue.each do |data|
  Hvalue.create(data)
end

japan = ActiveSupport::JSON.decode(File.read('db/japan_codes2.json'))
japan.each do |data|
  Japan.create(data)
end

hcontact = ActiveSupport::JSON.decode(File.read('db/160313_hcontact_dummy.json'))
hcontact.each do |data|
  Hcontact.create(data)
end