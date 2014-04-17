class PartFeelsController < ApplicationController    
  def index
    @columns  =["part_id", "feel_id"] 
    @column='part_id'  #search column    
    @search = PartFeel.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:part_feel).permit(:part_id, :feel_id)
      params.require(:part_feel).permit!            
    end
    
end
