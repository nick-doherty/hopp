class InterestsController < ApplicationController
  # before_filter :check_if_logged_in, :except => [:new]

  def new
    soundcloud = Source.find_by_source_name "soundcloud"
    youtube = Source.find_by_source_name "youtube"
    @soundcloud_interests = Interest.where(:source_id => soundcloud.id)
    @youtube_interests = Interest.where(:source_id => youtube.id)

  end

  def create

    soundcloud = Source.find_by_source_name('soundcloud')

    params[:user][:interest_ids].each do |interest_id|
      @interest = Interest.find interest_id

      @current_user.interests << @interest

    end

    youtube = Source.find_by_source_name('youtube')

    params[:user][:interest_ids].each do |interest_id|
      @interest = Interest.find interest_id

      @current_user.interests << @interest

    end

    redirect_to root_path
  end

  def edit

    @soundcloud_interests = Interest.where(:source_id => Source.find_by_source_name('soundcloud').id)
    @youtube_interests = Interest.where(:source_id => Source.find_by_source_name('youtube').id )

  end

end