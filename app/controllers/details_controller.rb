class DetailsController < ApplicationController
def index
  if user_signed_in?
    @details = Detail.all
  else
    redirect_to new_user_session_path
  end
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
def cedit
     if user_signed_in?
    @detail= Detail.find_by_user_id(params[:user_id])
    @user = current_user
    @u_detail = @user.detail
  else
    redirect_to new_user_session_path

  end
end
  def update
     @detail= Detail.find_by_user_id(params[:user_id])
      @detail.email = @detail.email
    @detail.user_id = @detail.user_id
  if @detail.update(detail_params)
   redirect_to details_path, :notice => "user details edited!!" 
  else
    render 'cedit'
  end  
  end
def cupdate
     @detail= Detail.find_by_user_id(params[:user_id])
      @detail.email = @detail.email
    @detail.user_id = @detail.user_id
  if @detail.update(detail_params)
   redirect_to dash_admin_path, :notice => "user details edited!!" 
  else
    render 'cedit'
  end
end
def destroy
   @detail= Detail.find_by_user_id(params[:user_id])
   @usr_del = User.find(@detail.user_id)
  @detail.destroy
  @usr_del.destroy
 
  redirect_to details_path, :notice => "user deleted"
end
def make_admin
  @detail= Detail.find_by_user_id(params[:user_id])
  @detail.toggle :admin
  @detail.save
  if @detail.save
    flash[:notice] = "the user was made admin"
    redirect_to details_path
  else
    flash[:notice] = "the user was not made admin"
    redirect_to details_path
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
  	params.require(:detail).permit(:first_name, :last_name, :admin, :contact_number, :address)
  end

end
