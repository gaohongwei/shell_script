<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController    
  def index
    @columns  =<%= attributes.map{|a|a.name} %> 
    @column='<%= attributes_names[0] %>'  #search column    
    @search = <%= class_name %>.search(params[:q])  
    @objs = @search.result.page(params[:page])     
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a trusted parameter "white list" through.
    def get_params
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      #params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      params.require(<%= ":#{singular_table_name}" %>).permit!            
      <%- end -%>
    end
    
end
<% end -%>
