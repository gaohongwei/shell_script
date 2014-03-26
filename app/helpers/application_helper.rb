require 'link_to'
require 'menu'
require 'page_tool'
require 'view_cfg'
require 'view_get'

module ApplicationHelper 
############## Public methods only ##############   
  def index_me(objs,sort_column,sort_direction, columns=nil, captions=nil, header=nil)
    columns ||=get_columns()
    captions||=get_captions()
    actions ||=get_actions() 
    header  ||=get_page_header()         
    render 'shared/index', :objs=>objs, 
    :sort_column=>sort_column, :sort_direction=>sort_direction,
    :columns=>columns, :header=>header,:captions=>captions,:actions=>actions
  end
  def show_me(obj,columns=nil,captions=nil, header=nil)
    myview=get_my_template('selfed')
    params[:myview]=myview   
    unless myview.nil? 
      render :template =>myview
    else
    columns ||=get_columns()
    captions||=get_captions()
    actions ||=get_actions() 
    header  ||=get_page_header(obj,:dft)  
    render 'shared/show', :obj=>obj,:columns=>columns,
    :captions=>captions,:header=>header,:actions=>actions
    end
  end  
  def form_me(obj,columns=nil,captions=nil, header=nil)   
    columns ||=get_columns()
    captions||=get_captions()
    actions ||=get_actions() 
    header  ||=get_page_header(obj,:dft)           
    render 'shared/form', :obj=>obj,:columns=>columns,
    :captions=>captions,:header=>header,:actions=>actions
  end    
  def link2actions(actions=nil,id=nil,controller=nil,data={})
    actions ||=get_actions()
    controller ||=get_controller()
    id ||=get_id()   
    render 'shared/actions', :actions=>actions,:id=>id,:controller=>controller
  end  
  def link2action(act,id=nil,controller=nil,data={})
    isbig=true       
    act,scope,label=act.split(':')
    label ||=tts("#{act} #{scope}")
    unless scope.nil?
      data.merge!({:scope=>scope})
    end
    link_to_controller_action(controller,act,label,id,isbig,data)
  end    
  def tt(key)
    key.blank?? '': t(key, :default => key)
  end 
  def tts(str)
    ar=str.split
    str=''
    ar.each do |key|
      str +=tt(key)
    end
    str
  end      
end