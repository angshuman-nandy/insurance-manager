class PoltypesController < ApplicationController
	def index
		
	end
	def new
		@poltype = Poltype.new
		@allcompany = Company.all
	end
	def create
		 @poltype= Poltype.new(poltype_params)
		 if @poltype.save
  		redirect_to dash_admin_path
  		else
  			redirect_to new_poltype_path
  		end
	end
 private

  def poltype_params
  	params.require(:poltype).permit(:name, :description, :company_id)
  end
end
