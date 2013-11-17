class InterestsController < ApplicationController
  # before_filter :check_if_logged_in, :except => [:new]

  def new
    @interest = Interest.new

  end

  def create
    @interest = Interest.new params[:interests]
    # raise params.inspect
    @interest.user_id = @current_user.id
    @interest.save

    redirect_to root_path
  end

end