Source.destroy_all
User.destroy_all

youtube = Source.create :source_name => 'youtube', :source_type => 'video'
soundcloud = Source.create :source_name => 'soundcloud', :source_type => 'audio'

user1 = User.create :name => 'Matthew', :email => 'matthew@gmail.com', :password => 'a', :password_confirmation => 'a'
user2 = User.create :name => 'Nick', :email => 'nick@gmail.com', :password => 'a', :password_confirmation => 'a'

Interest.create :source_id => youtube.id, :interest_name => 'toprated'
Interest.create :source_id => youtube.id, :interest_name => 'movies'
Interest.create :source_id => youtube.id, :interest_name => 'trailers'
Interest.create :source_id => youtube.id, :interest_name => 'tech'
Interest.create :source_id => youtube.id, :interest_name => 'news'
Interest.create :source_id => youtube.id, :interest_name => 'entertainment'
Interest.create :source_id => youtube.id, :interest_name => 'comedy'
Interest.create :source_id => youtube.id, :interest_name => 'games'
Interest.create :source_id => youtube.id, :interest_name => 'sports'
Interest.create :source_id => youtube.id, :interest_name => 'music'
Interest.create :source_id => youtube.id, :interest_name => 'travel'
Interest.create :source_id => youtube.id, :interest_name => 'animals'
Interest.create :source_id => youtube.id, :interest_name => 'howto'

Interest.create :source_id => soundcloud.id, :interest_name => 'hiphop'
Interest.create :source_id => soundcloud.id, :interest_name => 'reggae'
Interest.create :source_id => soundcloud.id, :interest_name => 'electronic'
Interest.create :source_id => soundcloud.id, :interest_name => 'pop'
Interest.create :source_id => soundcloud.id, :interest_name => 'rock'
Interest.create :source_id => soundcloud.id, :interest_name => 'classical'
Interest.create :source_id => soundcloud.id, :interest_name => 'metal'
Interest.create :source_id => soundcloud.id, :interest_name => 'world'
Interest.create :source_id => soundcloud.id, :interest_name => 'jazzblues'
Interest.create :source_id => soundcloud.id, :interest_name => 'comedy'
Interest.create :source_id => soundcloud.id, :interest_name => 'news'
Interest.create :source_id => soundcloud.id, :interest_name => 'sports'
Interest.create :source_id => soundcloud.id, :interest_name => 'books'


