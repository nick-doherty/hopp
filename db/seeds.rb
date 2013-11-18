Source.destroy_all
User.destroy_all

youtube = Source.create :source_name => 'youtube', :source_type => 'video'
soundcloud = Source.create :source_name => 'soundcloud', :source_type => 'audio'

user1 = User.create :name => 'Matthew', :email => 'matthew@gmail.com', :password => 'a', :password_confirmation => 'a'
user2 = User.create :name => 'Nick', :email => 'nick@gmail.com', :password => 'a', :password_confirmation => 'a'

