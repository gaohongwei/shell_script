class LevelsController < ApplicationController    
  def index
    @columns  =["name", "desc"] 
    @column='name'  #search column    
    @search = Level.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:level).permit(:name, :desc)
      params.require(:level).permit!            
    end
    
end
