class AreasController < ApplicationController    
  def index
    @columns  =["name"] 
    @column='name'  #search column    
    @search = Area.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:area).permit(:name)
      params.require(:area).permit!            
    end
    
end
