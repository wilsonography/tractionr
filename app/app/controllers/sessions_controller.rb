class SessionsController < ApplicationController

	skip_before_filter :require_login, :only => [:create, :login, :failure]

	def create
	  auth_hash = request.env['omniauth.auth'] if !auth_hash
	 
	  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	  @user = User.find_by_email(auth_hash['info']['email'])
	  if @authorization
	    redirect_to users_path
	    session[:user] = @authorization.user
	  elsif !@authorization && @user
	  		@user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"], :email => auth_hash["info"]["email"]
	  		@user.save!
	  else
	    @user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
	    if @user.save
		    @user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"], :email => auth_hash["info"]["email"]
		    @user.save!
	 	 end
	 	 session[:user] = @user
	    redirect_to projects_path   
	  end
	end
  
	def failure
  		render :text => "Sorry, but you didn't allow access to our app!"
	end
  
  	def login
  		render :layout => 'application'
  	end

	def destroy
 		session[:user] = nil
  		redirect_to login_path
	end
end