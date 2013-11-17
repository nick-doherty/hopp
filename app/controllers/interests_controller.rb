class InterestsController < ApplicationController
  # before_filter :check_if_logged_in, :except => [:new]

  def new
    @interest = Interest.new

  end

  def create

    params[:soundcloud_interest].each do |interest|
      @interest = Interest.new interest

      @interest.user_id = @current_user.id
      @interest.save

    end

    params[:youtube_interest].each do |interest|
      @interest = Interest.new interest

      @interest.user_id = @current_user.id
      @interest.save

    end

    redirect_to root_path
  end

end