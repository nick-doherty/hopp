class Content < ActiveRecord::Base
	attr_accessible :url, :duration, :interest_id
	has_and_belongs_to_many :interests
  set_table_name "content"

  #===============
  # Soundcloud
  #===============

  def self.populate_soundcloud(interest)

    client = Soundcloud.new(:client_id => '2807db7b829c81b57f6eff2c8d862e2a')
    tracks = client.get('/tracks', :genres => interest.downcase)

    #save this ish to the db
    tracks.each do |track|
      content = Content.new
      content.url = track.uri
      content.html = client.get('/oembed', :url => track.uri).html
      content.interest_id = Interest.find_by_interest_name(interest).id

      content.save
    end

  end

  #===============
  # Youtube
  #===============

    def self.populate_youtube(interest)
      client = YouTubeIt::Client.new(:username => "nick.doherty", :password =>  "dingolover1888", :dev_key => "AIzaSyBcOSkLmd0kFk3zKyWP5hu3i_vo4XSz05E")

      (1..5).each do |page|
        videos = client.videos_by(:categories => [interest], :per_page => 50, :page => page, :fields => {:view_count => "5000"}).videos

        videos.each do |video|
          content = Content.new
          content.url = video.embed_html5
          content.interest_id = Source.find_by_source_name('youtube').id

          content.save
        end
      end
    end

end

    # whats below probably belongs in the controller
    # n = (1 + rand(9))
    # @video = client.videos_by(:categories => [random_youtube_interest], :per_page => 50, :page => n, :fields => {:view_count => "5000"}).videos.shuffle.first


    # @random_soundcloud_interest = Interest.where(:source_id => Source.find_by_source_name('soundcloud').id ).shuffle.first.interest_name
