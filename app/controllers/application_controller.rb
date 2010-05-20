class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_access_to :all

  
  helper_method :current_user
  
  protected
  
  # Flashes an error message and redirects to the previous page if a user does not have permission to see the current page
  def permission_denied
    flash[:error] = "Sorry, you're not allowed to access that page"
    redirect_to root_url
  end
  
  
  private
  
  # Returns the session of the logged in user
  def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
  end
  
  # Returns the currently logged in user object
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
end
