class BookmarksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
  end

  def create
    Bookmark.create(:url => params[:url], :user_id => @current_user.id)
    render :json => {:status => 'okay'}
  end

  def delete
  end

end