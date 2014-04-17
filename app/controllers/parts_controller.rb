class PartsController < ApplicationController    
  def index
    @columns  =["name", "area_id"] 
    @column='name'  #search column    
    @search = Part.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:part).permit(:name, :area_id)
      params.require(:part).permit!            
    end
    
end
