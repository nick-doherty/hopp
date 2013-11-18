module ApplicationHelper
  def authentication_menu
    #built a list of links depending on the users permissions
    links = ""
    if @current_user.present?
      links += "<li> #{link_to('Edit Profile', edit_users_path )}</li>" +
      links += "<li> #{link_to('Logout ' + @current_user.name, logout_path, :method => 'delete', :confirm => 'Are you sure?')}</li>"
    end

    links
  end
end
