class DetailsController < ApplicationController
def index
end

def new
	if user_signed_in?
		@user=current_user
  	@detail = Detail.new
  end
  end

def create
  @detail = Detail.new(detail_params)
  		@detail.email = current_user.email
  		@detail.user_id = current_user.id 
  	if @detail.save
  		redirect_to dash_customer_path
  	end

  end

  private

  def detail_params
  	params.require(:detail).permit(:first_name, :last_name, :admin, :admin_email, :contact_number, :address,)
  end

end
