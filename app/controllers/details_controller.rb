class DetailsController < ApplicationController
def index
  @details = Detail.all
end
def show
  end

def new
	if user_signed_in?
		@user=current_user
  	@detail = Detail.new
  else
    redirect_to new_user_session_path
  end
  end

  

def create
  @detail = Detail.new(detail_params)
  		@detail.email = current_user.email
  		@detail.user_id = current_user.id 
      @detail.save
  	if @detail.save
  		redirect_to dash_customer_path
    else
       @detail = Detail.new(detail_params)
      @detail.email = current_user.email
      @detail.user_id = current_user.id 
      @detail.save
      render 'new'
  	end

  end

  private

  def detail_params
  	params.require(:detail).permit(:first_name, :last_name, :admin, :admin_email, :contact_number, :address,)
  end

end
