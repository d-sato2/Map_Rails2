# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hvalue = ActiveSupport::JSON.decode(File.read('db/160910_hvalue_sc.json'))
hvalue.each do |data|
  Hvalue.create(data)
end

japan = ActiveSupport::JSON.decode(File.read('db/japan_codes2.json'))
japan.each do |data|
  Japan.create(data)
end

hcontact = ActiveSupport::JSON.decode(File.read('db/hcontact.json'))
hcontact.each do |data|
  Hcontact.create(data)
end

hservice = ActiveSupport::JSON.decode(File.read('db/160910_hservice.json'))
hservice.each do |data|
  Hservice.create(data)
end

hselection = ActiveSupport::JSON.decode(File.read('db/160909_h_service_selection.json'))
hselection.each do |data|
  Hselection.create(data)
end