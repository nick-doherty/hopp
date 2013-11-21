# == Schema Information
#
# Table name: content
#
#  id          :integer          not null, primary key
#  interest_id :integer
#  url         :string(255)
#  duration    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  html        :text
#

class Content < ActiveRecord::Base
	attr_accessible :url, :duration, :interest_id, :html
	has_and_belongs_to_many :interests
  set_table_name "content"

  #===============
  # Soundcloud
  #===============
  def self.acquire_soundcloud_content(interest)
    tracks = Content.where(:interest_id => Interest.find_by_interest_name(interest).id)#.where('date > two weeks ago')
    if (tracks.length === 0)
      tracks = self.populate_soundcloud(interest)
    end
    tracks
  end


  def self.populate_soundcloud(interest)

    client = Soundcloud.new(:client_id => '2807db7b829c81b57f6eff2c8d862e2a')
    tracks = client.get('/tracks', :genres => interest)

    interest_id = Interest.find_by_interest_name(interest).id
    #save this ish to the db
    tracks = tracks.map do |track|
      content = Content.new
      content.url = track.uri
      content.duration = track.duration/1000
      content.html = "<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=#{CGI.escape track.uri}&show_artwork=true&client_id=2807db7b829c81b57f6eff2c8d862e2a\"></iframe>"
      content.interest_id = interest_id
      content.save
      content
    end
    tracks
  end

  #===============
  # Youtube
  #===============
  def self.acquire_youtube_content(interest)
    videos = Content.where(:interest_id => Interest.find_by_interest_name(interest).id)#.where('date > two weeks ago')
    if (videos.length === 0)
      videos = self.populate_youtube(interest)
    end
    videos
  end


  def self.populate_youtube(interest)
    client = YouTubeIt::Client.new(:username => "nick.doherty", :password =>  "dingolover1888", :dev_key => "AIzaSyBcOSkLmd0kFk3zKyWP5hu3i_vo4XSz05E")

    videos = []
    (1..5).each do |page|
      videos = client.videos_by(:categories => [interest], :per_page => 50, :page => page, :fields => {:view_count => "5000"}).videos

      interest_id = Interest.find_by_interest_name(interest).id

      videos = videos.map do |video|
        content = Content.new
        content.url = video.embed_html5
        content.duration = video.duration
        content.interest_id = interest_id

        content.save
        content
      end
    end
    videos
  end

  def self.acquire_medium_content(interest)
    article = Content.where(:interest_id => Interest.find_by_interest_name(interest).id)
    if (article.length === 0)
      article = self.populate_medium(interest)
    end
    article
  end

  def self.populate_medium(interest)
    page = Nokogiri::XML( open("https://medium.com/feed/#{interest}") )
    links = page.xpath('rss/channel/item/link').map { |l| l.text }

    interest_id = Interest.find_by_interest_name(interest).id

    links.each do |link|
      page = Nokogiri::HTML( open(link) )
      Content.create :url => link, :html => page.css('.post-content-inner').inner_html, :duration => 120, :interest_id => interest_id
    end
    # article = Nokogiri::HTML(open(links.shuffle.first))
    # html = article.css('.post-content-inner').inner_html

  end


end

    # whats below probably belongs in the controller
    # n = (1 + rand(9))
    # @video = client.videos_by(:categories => [random_youtube_interest], :per_page => 50, :page => n, :fields => {:view_count => "5000"}).videos.shuffle.first


    # @random_soundcloud_interest = Interest.where(:source_id => Source.find_by_source_name('soundcloud').id ).shuffle.first.interest_name
