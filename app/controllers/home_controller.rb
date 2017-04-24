class HomeController < ApplicationController
  
  def welcome
  	
  end
  def index
  	if user_signed_in?
  		redirect_to dash_customer_path
  	else
  		redirect_to new_user_session_path
  		
  	end
  
  end

end
