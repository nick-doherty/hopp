module ApplicationHelper
  def authentication_menu
    #built a list of links depending on the users permissions
    links = ""
    if @current_user.present?
        links += "#{link_to('Home', root_path, :data => { :icon => "home"} )}"
        links += "#{link_to('Edit Profile', edit_users_path, :data => { :icon => "gear"} )}"
        links += "#{link_to('Logout ' + @current_user.name, logout_path, :data => { :icon => "alert"}, :method => 'delete', :confirm => 'Are you sure?')}"
    end

    links
  end
end
