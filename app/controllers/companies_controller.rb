class CompaniesController < ApplicationController
  def index
    if user_signed_in?
		  @companies= Company.all
    else
      redirect_to new_user_session_path
    end
	end

  def companyShow
    if user_signed_in?
      @company = Company.find_by_id(params[:id])
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
    else
      redirect_to new_user_session_path
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
    @pol_d = Policy.where(:company_id => @company.id)
    @pol_d.each do |i|
      i.destroy
      
    end
    @company.destroy
 
    redirect_to companies_path, :notice => "company deleted"
  end


 private

  def company_params
  	params.require(:company).permit(:name, :description)
  end
end
