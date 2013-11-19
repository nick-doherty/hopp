Source.destroy_all
User.destroy_all

youtube = Source.create :source_name => 'youtube', :source_type => 'video'
soundcloud = Source.create :source_name => 'soundcloud', :source_type => 'audio'

user1 = User.create :name => 'Matthew', :email => 'matthew@gmail.com', :password => 'a', :password_confirmation => 'a'
user2 = User.create :name => 'Nick', :email => 'nick@gmail.com', :password => 'a', :password_confirmation => 'a'

Interest.create :source_id => youtube.id, :interest_name => 'Top Rated'
Interest.create :source_id => youtube.id, :interest_name => 'Movies'
Interest.create :source_id => youtube.id, :interest_name => 'Trailers'
Interest.create :source_id => youtube.id, :interest_name => 'Tech'
Interest.create :source_id => youtube.id, :interest_name => 'News'
Interest.create :source_id => youtube.id, :interest_name => 'Entertainment'
Interest.create :source_id => youtube.id, :interest_name => 'Comedy'
Interest.create :source_id => youtube.id, :interest_name => 'Games'
Interest.create :source_id => youtube.id, :interest_name => 'Sports'
Interest.create :source_id => youtube.id, :interest_name => 'Music'
Interest.create :source_id => youtube.id, :interest_name => 'Travel'
Interest.create :source_id => youtube.id, :interest_name => 'Animals'
Interest.create :source_id => youtube.id, :interest_name => 'How To'

Interest.create :source_id => soundcloud.id, :interest_name => 'Hip Hop'
Interest.create :source_id => soundcloud.id, :interest_name => 'Reggae'
Interest.create :source_id => soundcloud.id, :interest_name => 'Electronic'
Interest.create :source_id => soundcloud.id, :interest_name => 'Pop'
Interest.create :source_id => soundcloud.id, :interest_name => 'Rock'
Interest.create :source_id => soundcloud.id, :interest_name => 'Classical'
Interest.create :source_id => soundcloud.id, :interest_name => 'Metal'
Interest.create :source_id => soundcloud.id, :interest_name => 'World'
Interest.create :source_id => soundcloud.id, :interest_name => 'JazzBlues'
Interest.create :source_id => soundcloud.id, :interest_name => 'Comedy'
Interest.create :source_id => soundcloud.id, :interest_name => 'News'
Interest.create :source_id => soundcloud.id, :interest_name => 'Sports'
Interest.create :source_id => soundcloud.id, :interest_name => 'Books'


