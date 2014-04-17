class SymptomsController < ApplicationController
  def index
    @columns  =["name", "part_id", "feel_id"]
    @column='name'  #search column    

    if params && params[:part_id]
      @objs =Symptom.by_part(params[:part_id])
    elsif params && params[:q] && params[:q].is_a?(String)
      @objs =Symptom.where("name like ?","%#{params[:q]}%")
    else #params && params[:q]
      @search = Symptom.search(params[:q])
      @objs = @search.result.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :json => @objs }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:symptom).permit(:name, :part_id, :feel_id)
      params.require(:symptom).permit!
    end

end
