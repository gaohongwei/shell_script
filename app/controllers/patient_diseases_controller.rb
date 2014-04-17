class PatientDiseasesController < ApplicationController    
  def index
    @columns  =["patient_id", "disease_id"] 
    @column='patient_id'  #search column    
    @search = PatientDisease.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      #params.require(:patient_disease).permit(:patient_id, :disease_id)
      params.require(:patient_disease).permit!            
    end
    
end
