module ApplicationHelper 
  def menu_bar
    render 'shared/menu'
  end  
  def search_area
    render(partial: '/shared/search', locals: {placeholder: tt('placeholder')})
  end  
  def submit_button(f,label=tt('submit'))
    render 'common/submit', :f=>f,:label=>label
  end  
def link_act(label, apath,opt={})
	ar=apath.split('#')
	if ar.size >1
	link_to(label,{controller: ar[0], action: ar[1]},opt)	
	else
	link_to(label,apath,opt)	
	end		
end

	def sys_menu
	[
		{
			caption:tt('diagnostic'),
			position:'left',
			subitems:[
				{caption: tts('patient index'), path:"patients#index"},				
				{caption: tts('new patient'), path:"patients#new"}							
			]
		},
		{
			caption:tt('knowledge_db'),
			position:'left',
			subitems:[
				{caption: tt('disease'), path:"diseases#index"},		
				{caption: tt('symptom'), path:"symptoms#index"},										
				'---'				
			]
		},	
		{
			caption:tt('base_data'),
			position:'left',
			subitems:[
				#{caption: tt('area'), path:"areas#index"},
				{caption: tt('part'), path:"parts#index"},
				{caption: tt('feel'), path:"feels#index"},
				{caption: tt('level'), path:"levels#index"},				
				'---'				
			]
		}
	]
	end
end