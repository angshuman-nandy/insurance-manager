class DashController < ApplicationController
	def admin
	if user_signed_in?
		@user= current_user
		@user_details = @user.detail
		if @user_details.admin == false
			redirect_to dash_customer_path
		end
	else
		redirect_to new_user_session_path
	end

	end
	
	def customer
		if user_signed_in?
		@user= current_user
		@user_details = @user.detail
		if @user_details.admin == true
			redirect_to dash_admin_path
		end
	else
		redirect_to login_path
	end

	end
end
