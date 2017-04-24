class PoliciesController < ApplicationController
  def index
		
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
  def show
		
  end
  def new
    @policy= Policy.new
	@c_id = params[:company_id]
	@p_id = params[:poltype_id]
	@allcompany = Company.all
	@alluserdetail= Detail.all
	@allptype = Poltype.all
  end
  def create
    @policy= Policy.new(policy_params)
	  if @policy.save
  	    redirect_to dash_admin_path
  	  else
  		redirect_to new_policy_path
  	  end
   end
   private
     def policy_params
  	  params.require(:policy).permit(:holder_name,:policy_type,:description,:sum_insured,:premium_amount,:commission, :purchase_date, :mature_date, :user_id,:company_id,:poltype_id)
     end
 end
