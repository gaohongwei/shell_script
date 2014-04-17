############## Removed  ############## 
module ApplicationHelper
  # returns a link and icon to sort table columns
  def sort_col_new(sort_direction, sort_column, column,cur_head=nil)
    #http://railscasts.com/episodes/228-sortable-table-columns
    cur_head ||=cur_col
    title= tt(cur_head)
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
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
  
  def sort_icon(sort_direction, column, table_column)
    return nil if column != table_column    
    return content_tag(:i, nil, {class: "current #{sort_direction}", style: 'float: right'})

  end 

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
  def show_me0(obj,columns=nil,captions=nil, header=nil)
    myview=get_my_template()
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
  def form_me0(obj,columns=nil,captions=nil, header=nil)   
    myview=get_my_template()
    params[:myview]=myview 
    columns ||=get_columns()      
    unless myview.nil? 
      render :template =>myview,:obj=>obj,:columns=>columns
    else    
    columns ||=get_columns()
    captions||=get_captions()
    actions ||=get_actions() 
    header  ||=get_page_header(obj,:dft)           
    render 'shared/form', :obj=>obj,:columns=>columns,
    :captions=>captions,:header=>header,:actions=>actions
    end  
  end 
end