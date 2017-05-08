class PoltypesController < ApplicationController
	def index
		if user_signed_in?
		@poltypes= Poltype.all
		@allcompany= Company.all
	else
		redirect_to new_user_session_path
	end
	end
	def show
		
	end
	def new
		if user_signed_in?
		@poltype = Poltype.new
		@allcompany = Company.all
	else
		redirect_to new_user_session_path
	end
	end
	def create
		 @poltype= Poltype.new(poltype_params)
		 if @poltype.save
  		redirect_to dash_admin_path
  		else
  			render 'new'
  		end
	end

	def edit
     if user_signed_in?
    @poltype = Poltype.find(params[:id])
    @user = current_user
    @u_detail = @user.detail
  else
    redirect_to new_user_session_path

  end
    
  end
	def update
     @poltype = Poltype.find(params[:id])
  if @poltype.update(poltype_params)
   redirect_to poltypes_path, :notice => "plan edited!!" 
  else
    render 'edit'
  end
end
def destroy
  @poltype = Poltype.find(params[:id])
  @poltype.destroy
 
  redirect_to poltypes_path, :notice => "plan deleted"
end


 private

  def poltype_params
  	params.require(:poltype).permit(:name, :description, :company_id, :duration, :sum_insured, :premium_amount)
  end
end
