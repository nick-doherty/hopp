class ContentController < ApplicationController

  def new
  end

  def create
  end

  def show

    content_type = ['video', 'music', 'article']
    random_number = [0, 1] #, 2]
    i = random_number.shuffle.first
    @show = content_type[i]

    if @show == content_type[0]
      # raise params.inspect
      # client = YouTubeIt::Client.new(:username => "nick.doherty", :password =>  "dingolover1888", :dev_key => "AIzaSyBcOSkLmd0kFk3zKyWP5hu3i_vo4XSz05E")

      # interest = @current_user.interests.where(:source_id => Source.find_by_source_name('youtube').id ).sample.interest_name
      # random_youtube_interest = ":" + interest
      # n = (1 + rand(9))

      # @video = client.videos_by(:categories => [random_youtube_interest], :per_page => 50, :page => n, :fields => {:view_count => "5000"}).videos.shuffle.first
      @video = Content.where(:interest_id => 7).shuffle.first.url

    elsif @show == content_type[1]
      #raise params.inspect
      @check = Content.where(:interest_id => 6).shuffle.first.html

      # raise params.inspect
      #client = Soundcloud.new(:client_id => '2807db7b829c81b57f6eff2c8d862e2a')

      # @random_soundcloud_interest = @current_user.interests.where(:source_id => Source.find_by_source_name('soundcloud').id ).shuffle.first.interest_name

      # track_url = client.get('/tracks', :genres => @random_soundcloud_interest.downcase).sample.uri
      #@embed_info = client.get('/oembed', :url => @check)


    # elsif @show = content_type[2]
    #   use filter to get rss content based on ('interest')

      render 'show'
    end

  end

end