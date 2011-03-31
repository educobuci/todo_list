######### Users

Factory.define :user do |f|
  f.name 'Dudu'
  f.email 'dudu@example.com'
  f.password '123456'
  f.avatar 'avatar.png'
  
  f.lists { |user| [user.association(:public_list), user.association(:private_list)] }
end

Factory.define :some_user, :class => User do |f|
  f.name 'Some user'
  f.email 'some@example.com'
  f.password '123456'
  f.avatar 'some.png'
  
  f.lists { |user| [user.association(:home_work)] }
end

######### Lists

Factory.define :public_list, :class => List do |f|
  f.name 'some public list'
  f.public 1
  f.items { |list| [list.association(:item)] }
end
Factory.define :private_list, :class => List do |f|
  f.name 'some private list'
  f.public 0
end
Factory.define :home_work, :class => List do |f|
  f.name 'home work'
  f.public 1
end

######## Items

Factory.define :item do |f|
  f.name 'some item'
end