class CompaniesController < ApplicationController
	def index
		@companies= Company.all
	end
	def show
		
	end
	def new
		@company = Company.new
	end
	def create
		 @company= Company.new(company_params)
		 if @company.save
  		redirect_to dash_admin_path
  		else
  			render 'new'
  		end
	end

 private

  def company_params
  	params.require(:company).permit(:name, :description)
  end
end
