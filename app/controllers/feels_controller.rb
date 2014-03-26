class FeelsController < ApplicationController
  SEARCH_COL = Feel.column_names[1]
    
  def index
    condition = "#{SEARCH_COL} like ?"
    @sort_direction = sort_direction
    @sort_column = sort_column(SEARCH_COL)
    order_by=@sort_column + " " + sort_direction
        
    @objs = Feel.where(condition, "%#{params[:search]}%")
      .page(params[:page]).order(order_by)   

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
