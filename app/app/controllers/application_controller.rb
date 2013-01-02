class ApplicationController < ActionController::Base
  
  protect_from_forgery
    
  before_filter :require_login, :except => [:login_required, :current_user]
  helper_method :current_user
  helper ApplicationHelper

  
   def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "session", :action => "login"
    return false 
  end
  
  def current_user
  		session[:user]
  end
   
  def require_login
  		unless current_user
  			redirect_to :login
  		end
  end
  
end
