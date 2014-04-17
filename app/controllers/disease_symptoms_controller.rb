class DiseaseSymptomsController < ApplicationController    
  def index
    @columns  =["disease_id", "symptom_id", "level_id", "pct"] 
    @column='disease_id'  #search column    
    @search = DiseaseSymptom.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:disease_symptom).permit(:disease_id, :symptom_id, :level_id, :pct)
      params.require(:disease_symptom).permit!            
    end
    
end
