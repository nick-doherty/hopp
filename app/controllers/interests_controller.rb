class InterestsController < ApplicationController
  # before_filter :check_if_logged_in, :except => [:new]

  def new
    @interest = Interest.new

  end

  def create

    soundcloud = Source.find_by_source_name('soundcloud')

    params[:soundcloud_interest].each do |interest|
      @interest = Interest.new :interest_name => interest

      @interest.user_id = @current_user.id
      @interest.source_id = soundcloud.id
      @interest.save

    end

    youtube = Source.find_by_source_name('youtube')

    params[:youtube_interest].each do |interest|
      @interest = Interest.new :interest_name => interest

      @interest.user_id = @current_user.id
      @interest.source_id = youtube.id
      @interest.save

    end

    redirect_to root_path
  end

  def edit
  end

end