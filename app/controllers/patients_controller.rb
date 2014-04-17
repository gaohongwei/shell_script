class PatientsController < ApplicationController    
  def index
    @columns  =["name", "sex", "year", "jiguang", "user_id"] 
    @column='name'  #search column    
    @search = Patient.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:patient).permit(:name, :sex, :year, :jiguang, :user_id)
      params.require(:patient).permit!            
    end
    
end
