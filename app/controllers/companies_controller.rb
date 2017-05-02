class CompaniesController < ApplicationController
	def index
    if user_signed_in?
		@companies= Company.all
  else
    redirect_to new_user_session_path
  end
	end
	def show
		
	end
	def new
    if user_signed_in?
		@company = Company.new
        @user = current_user
    @u_detail = @user.detail
  end
	end
	def create
		 @company= Company.new(company_params)
		 if @company.save
  		redirect_to dash_admin_path
  		else
  			render 'new'
  		end
	end
 def edit
     if user_signed_in?
    @company = Company.find(params[:id])
    @user = current_user
    @u_detail = @user.detail
  else
    redirect_to new_user_session_path

  end
    
  end
	def update
     @company = Company.find(params[:id])
  if @company.update(company_params)
   redirect_to dash_admin_path, :notice => "company edited!!" 
  else
    render 'edit'
  end
end
def destroy
  @company = Company.find(params[:id])
  @poltype_del = Poltype.find_by_company_id(@company.id)
  @policy_del = Policy.find_by_company_id(@company.id)
  if @policy_del!= nil && @poltype_del!= nil
  @policy_del.destroy
  @poltype_del.destroy
  @company.destroy
end
 
  redirect_to companies_path, :notice => "company deleted"
end

 private

  def company_params
  	params.require(:company).permit(:name, :description)
  end
end
