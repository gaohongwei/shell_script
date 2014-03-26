# encoding: utf-8 
# Examples:
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
parts=[
"头",
"手心",
"脚",
"胸部",
"腹部",
"后背"
]


feels=[
"痛",
"麻",
"冷",
"热",
"胀"
]

feels.each do |name|
  Feel.create(:name=>name)
end

parts.each do |name|
  Part.create(:name=>name)
end