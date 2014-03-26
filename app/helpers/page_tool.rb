module ApplicationHelper
############## All  page ############## 
  def page_link (obj)
    paginate(obj) #kaminari
  end  
  def page_header(obj=nil,header=nil) 
    if obj.nil? 
      header=get_page_header()
    else
      header=get_page_header(obj,:dft)
    end
    "<div class='page-header'><h2>#{header}</h2></div>"
  end 
  def get_page_header(obj=nil,opt=nil)
    resource=get_resource
    action=get_action
    id=get_id()
    header="#{action} : #{resource}"
    header=tts(header)

    dft_columns=get_columns(:dft)
    dft_columns ||=get_columns()
    column=dft_columns[0]
    unless id.nil? || column.nil?
      header +="(#{get_attr(obj,column)})"
    end
    header
  end 
  def get_my_template(path=nil)
    path||= 'selfed'
    ctl=get_controller()
    act=get_action()
    opt=get_scope()   
    fname="_#{ctl}.#{act}"
    fname="#{fname}.#{opt}" unless opt.nil?
    fname=File.join(path,fname)
    template=fname  
    fname="#{fname}.html.erb"      
    fname=File.join(Rails.root,'app', 'views',fname)
    params[:fname]=fname
    if File.exist?(fname)
      
      return template
    else       
      return nil
    end
  end
  def get_my_view(path=nil)
    path||='selfed'
    ctl=get_controller()
    act=get_action()
    opt=get_scope()   
    fname="_#{ctl}.#{act}"
    fname="#{fname}.#{opt}" unless opt.nil?
    fname=File.join(path,fname)
    partial="#{fname}.html.erb"
    if File.exist?(partial)
      params[:partial]=partial
      params[:myview]=fname          
      return fname
    else 
      params[:partial]='DontExist'
      params[:myview]='DontExist'        
      return nil
    end
  end
############## Form page ############## 
  def f_input(f,column,label=nil,adv=nil)
    column,type=column.split(':')
    label ||=column
    label =tt(label)    
    params[:type]=type
    opt={:label=>label}
    opt.merge!(adv) unless adv.nil? 
    adv=nil   
    unless type.nil?
      case type
      when 'c','checkbox','cb'
        adv={:as => :check_boxes}
      when 'r','radio','rd'
        adv={:as => :radio}   
      when 'l','list','ls'
        adv={:as => :list}   
      else
      end
    end #unless
    opt.merge!(adv) unless adv.nil?
    f.input column.to_sym,opt
  end
  def f_checkbox(f,column,label=nil)
    f_input(f,column,label,{:as => :check_boxes})
  end
  def ptd(s)
    "<td>#{s}</td>"
  end
  def button_submit(f,label=tt('submit'))
    render 'shared/button_submit', :f=>f,:label=>label
  end
  def button_add(f,ham,label=tt('add'))
    #render 'shared/button_add', :f=>f,:label=>label,:ham=> ham
    klass='btn  btn-primary'
    f.link_to_add(label,ham, :class => klass)
  end
  def button_del(f,label=tt('remove'))
    #render 'shared/button_del', :f=>f,:label=>label
    klass='btn btn-danger btn-mini'
    f.link_to_remove(label,:class => klass)
  end
  # returns a link and icon to sort table columns
  def sort_col(direction, sort_col, cur_col,cur_head=nil)
    cur_head ||=cur_col
    cur_head= tt(cur_head)
    sortable(cur_col,cur_head) +  sort_icon(direction, sort_col, cur_col)
  end
  # returns a link to sort table columns 
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = params[:direction] == "asc" ? "desc" : "asc"
    link_to title, sort: column, direction: direction
  end
  
  def sort_icon(direction, column, table_column)
    return nil if column != table_column    
    return content_tag(:i, nil, {class: 'icon-chevron-up', style: 'float: right'}) if direction == 'asc'
    return content_tag(:i, nil, {class: 'icon-chevron-down', style: 'float: right'}) if direction == 'desc'
  end
  
  # display a message using the JQuery Toast Message plugin
  # types available: notice, success, warning an error
  def display_toast_message(message, type)
    return nil unless ['notice', 'success', 'warning', 'error'].include? type.to_s.downcase
    result = "<script>"
    result << "$().toastmessage('show#{type.to_s.capitalize}Toast', '#{message}');"
    result << "</script>"
    result.html_safe
  end 
############## Get from params ############## 
   def get_attr(obj,attrs)
    attrs,type=attrs.split(':') # remove column type
    ar=attrs.split('.')
    ar.each{|attr| obj=obj.send(attr) }
    return obj
  end
  def get_controller()
    params[:controller]
  end
  def get_resource()
    get_controller.singularize
  end
  def get_action()
    params[:action]
  end
  def get_id()
    params[:id]
  end
  def get_scope()
    params[:scope]
  end  
  def get_obj
    obj_name=''
    id=get_id()
    if id.nil?
      obj_name='HasData'
    end
  end

############## Removed  ############## 
  def zno_data()
    "<tr><td colspan='10'>#{tt('empty')}</td></tr>"
  end

  def ztable_header(direction, sort_col, columns)
    str='<table class="table table-striped table-bordered table-condensed">'
    str +='<thead>'
    str +='<tr>'
    columns.each do |cur_col|
      str +='<th>'
      str +=sort_col(direction, sort_col, cur_col)
      str +='</th>'     
    end
    str +="<th width='140px'><a href='#'>#{tt('actions')}</a></th>"
    str +='<vtr>'
    str +='</thead>'
  end
  def zindex_header(str,objs)
    page_header(str)+ search_area + page_link(objs)
  end  
end