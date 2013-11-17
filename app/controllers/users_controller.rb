class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except =>[:new, :create]

  def new
    @user = User.new
    @company = Company.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path
    end
  end

  def edit
    #where do we get @authenticated from?
    @user = @authenticated
    render "edit"
  end

  def update
    @user = @authenticated
    if @user.update_attributes params[:user]
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @authenticated.nil?
  end

end