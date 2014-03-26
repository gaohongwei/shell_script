module CrudHelper
  def index
    set_objs
  end
  def new  
    @obj=model.send("new")
  end
  def create
    @obj=model.send("new",get_params)   
    if @obj.save
      redirect_to @obj, notice: tt('created')
    else
      render action: 'new'
    end    
    
  end
# show, edit omitted
  def update
    if @obj.update_attributes(get_params)
    #f @obj.update(get_params)      
    #render :show
      redirect_to @obj, notice: tt('updated')
    else
      render action: 'edit'
    end
  end
  def destroy
    @obj.destroy
    set_objs
    render :index, notice: tt('destroyed')
  end
private
  def modelname
    @modelname ||=controller_name.classify          
  end
  def model
    # Equivalent of @house_buyers = HouseBuyer.find(:all)
    # objects = controller_name.classify.constantize.all    
    #res_name=self.class.name.sub("Controller", "")
    #@model=res_name.singularize      
    @model ||=modelname.constantize   
    #@mode =Kernel.const_get(@modelname)  

  end
  def set_obj
    instance_variable_set("@obj", model.find(params[:id]))    
  end
  def set_objs
    instance_variable_set("@objs", model.all)
  end
  def sort_column(deault_col)
    model.column_names.include?(params[:sort]) ? params[:sort] : deault_col
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
      
end