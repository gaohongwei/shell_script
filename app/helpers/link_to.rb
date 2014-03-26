module ApplicationHelper
############## Public  ############## 
  def edit_delete(id=nil,controller=nil,isbig=true)
    controller ||=get_controller()
    id ||=get_id()
    link2edit(controller,id,isbig)+link2delete(controller,id,isbig)
  end
############## Private  ##############  
  def link_to_controller_action(controller,action,label=nil,id=nil,isbig=false,data={})
  	if isbig
  	 css_class='btn btn-primary'
  	else
  	 css_class='btn btn-small'
  	end
    controller ||=get_controller()
    label ||=tt(action)   
    options={ :controller => controller, :action =>action }

  	unless(id.nil?)
      options.merge!({:id=>id})
  	end
    unless(data.nil?||data.empty?)
      if(data.is_a?(Hash))
        options.merge!(data)      
      end
    end
    link_to label, options,:class => css_class
  end
  def link2new(controller,isbig=true,label=nil)
  	link_to_controller_action(controller,'new',label,nil,isbig)
  end
  def link2index(controller,isbig=true,label=nil)
  	link_to_controller_action(controller,'index',label,nil,isbig)
  end

  def link2show(controller,id,isbig=true,label=nil)
  	 link_to_controller_action(controller,'show',label,id,isbig)
  end
  def link2edit(controller,id,isbig=true,label=nil)
  	 link_to_controller_action(controller,'edit',label,id,isbig)
  end

  def link2delete(controller,id,isbig=true,label=nil)
    label ||=tt('delete')
  	link_to label, 
       { :controller => controller, :action => 'destroy', :id => id }, # your URL details
       { :confirm => tt('sure')+'?', :method => :delete, :class => 'btn btn-danger btn-small'}
  end
############## Removed  ##############   
  def xedit_scope(controller,id,label,scope)
    data={:scope=>scope}
    isbig=true
    link_to_controller_action(controller,'edit',label,id,isbig,data)
  end  
end