class DiseasesController < ApplicationController    
  def index
    @columns  =["name", "same_id"] 
    @column='name'  #search column    
    @search = Disease.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:disease).permit(:name, :same_id)
      params.require(:disease).permit!            
    end
    
end
