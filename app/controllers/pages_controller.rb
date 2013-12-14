class PagesController < ApplicationController
  def home
  end

  def begin
  end

  def end
  end

  def demo
    random_medium_interest = ["dear-blank", "what-i-learned-today", "best-thing-i-found-online-today", "comedy-corner"]
    random_soundcloud_interest = ["hiphop", "rock", "jazzblues"]
    random_youtube_interest = ["toprated", "trailers", "entertainment", "animals"]

    random_feed_address = random_medium_interest.shuffle.first

    @show = [0, 1, 2].sample

    if @show == 0
      # raise "whatever"
      client = Soundcloud.new(:client_id => '2807db7b829c81b57f6eff2c8d862e2a')
      track_url = client.get('/tracks', :genres => random_soundcloud_interest.sample).sample.uri

      @soundcloud_content = client.get('/oembed', :url => track_url).html

    elsif @show == 1
      client = YouTubeIt::Client.new(:username => "nick.doherty", :password =>  "dingolover1888", :dev_key => "AIzaSyBcOSkLmd0kFk3zKyWP5hu3i_vo4XSz05E")
      @youtube_content = client.videos_by(:categories => [":" + random_youtube_interest.sample]).videos.sample.embed_html5

      #@check = Content.where(:interest_id => 17).shuffle.first.html
    elsif @show == 2

      page = Nokogiri::XML( open("https://medium.com/feed/#{random_feed_address}") )
      links = page.xpath('rss/channel/item/link').map { |l| l.text }

      article = Nokogiri::HTML(open(links.shuffle.first))
      @medium_content = article.css('.post-content').inner_html
    end
  end
end
