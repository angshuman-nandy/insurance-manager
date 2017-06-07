class PoliciesController < ApplicationController
  def index
		if user_signed_in?
       @policies = Policy.all
       @user = current_user
    @u_detail = @user.detail
    else
      redirect_to new_user_session_path
    end
  end
  def show
  
  end
  def display
     if user_signed_in?
     @policy = Policy.find_by_id(params[:id])
  else
    redirect_to new_user_session_path
  end
  end
  def select_company
    if user_signed_in?
	  @allcompany = Company.all
	else
	  redirect_to new_user_session_path
	end
  end
  def select_plan
    if user_signed_in?
      @c_id = params[:company_id]
    else
      redirect_to new_user_session_path
    end  
	
  end
  def edit
     if user_signed_in?
    @policy = Policy.find(params[:id])
    @user = current_user
    @u_detail = @user.detail
  else
    edirect_to new_user_session_path

  end
    
  end
def update
     @policy = Policy.find(params[:id])
  if @policy.update(policy_params)
   redirect_to dash_admin_path, :notice => "policy edited!!" 
  else
    render 'edit'
  end
end
def destroy
  @policy = Policy.find(params[:id])
  @policy.destroy
 
  redirect_to policies_path, :notice => "policy deleted"
end
  def show
		
  end
  def new
    if user_signed_in?
      @policy= Policy.new
	  @c_id = params[:company_id]
	  @p_id = params[:poltype_id]
    @user = current_user
    @u_detail = @user.detail
    @alluserdetail= Detail.all
	  if @c_id == nil
	  	redirect_to policies_select_company_path
	  end
  else
     redirect_to new_user_session_path
    end  
  end

  def create
    @policy= Policy.new(policy_params)
	  if @policy.save
  	    redirect_to dash_admin_path, :notice => "policy saved!!" 
  	  else
  		redirect_to new_policy_path, :notice => "policy could not be saved please enter all details"
  	  end
   end
   private
     def policy_params
  	  params.require(:policy).permit(:policy_type,:description,:sum_insured,:premium_amount,:commission, :purchase_date, :mature_date, :user_id,:company_id,:poltype_id)
     end
 end
