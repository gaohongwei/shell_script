class FeelsController < ApplicationController    
  def index
    @columns  =["name"] 
    @column='name'  #search column    
    @search = Feel.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:feel).permit(:name)
      params.require(:feel).permit!            
    end
    
end
