forums = ['Ruby ve Aliesi', 'Programlama Genel', 'Genel Konular', 'Otomobil Kulubü', 'Tasarım Genel', 'Html & Css']

forums.each do |forum|
  #noinspection Rails3Deprecated
  Forum.find_or_create_by_name(forum)
  puts "- #{forum} forumu oluşturuldu"
end