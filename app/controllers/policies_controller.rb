class PoliciesController < ApplicationController
	def index
		
	end
	def show
		
	end
	def new
		@policy= Policy.new
		@allcompany = Company.all
		@alluserdetail= Detail.all
		@allptype = Poltype.all
	end
	def create
		 @policy= Poltype.new(policy_params)
		 if @policy.save
  		redirect_to dash_admin_path
  		else
  			redirect_to new_policy_path
  		end
	end

	 private

  def policy_params
  	params.require(:policy).permit(:holder_name, :policy_type, :description, :sum_insured, :premium_amount, :commission, :purchase_date, :mature_date, :user_id, :company_id)
  end
end
