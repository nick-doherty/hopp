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
      client = YouTubeIt::Client.new(:username => "nick.doherty", :password =>  "_____", :dev_key => "AIzaSyBcOSkLmd0kFk3zKyWP5hu3i_vo4XSz05E")

      @video = client.videos_by(:categories => [:news]).videos.sample


    elsif @show == content_type[1]
      client = Soundcloud.new(:client_id => '2807db7b829c81b57f6eff2c8d862e2a')

      track_url = client.get('/tracks', :genres => 'comedy').sample.uri
      @embed_info = client.get('/oembed', :url => track_url)


    # elsif @show = content_type[2]
    #   use filter to get rss content based on ('interest')

      render 'show'
    end

  end

end