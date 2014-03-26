module ApplicationHelper
	ACTS=['show','edit','index','new'] 
	VIEWS={
		symptoms:
		{
			acts:[
				'show',
				'edit',
				'index','new'],
			index:{
				dft:{				
					cols:["name", "part.name", "feel.name"],
					caps:["name", "part", "feel"],
				}				
			},
			show:{
				dft:{
					cols:["name", "part_id", "feel_id"], 
					caps:["name", "part", "feel"],					
				},
				adv:{
					cols:["name", "part_id", "feel_id"], 
					caps:["name", "part", "feel"],					
				}
			}
# No edit key. Edit will be similar with Show
# No new  Key. New  will be similar with edit:dft				
		},	# controller
		diseases:
		{
			acts:[
				'show:dft','show:symptom',
				'edit:dft','edit:symptom',
				'index','new'],
			index:{
				dft:{				
					cols:["name", "same_id"],
					caps:["name", "name"]
				}				
			},
			show:{
				dft:{
					cols:["name"],
					caps:["name"]				
				},
				symptom:{
					cols:["symptoms:c"],
					caps:["symptom"]				
				}
			}						
		},	# controller
		patients:
		{
			acts:[
				'show:dft','show:symptom',
				'edit:dft','edit:symptom',
				'index','new'],
			index:{
				dft:{				
					cols:["name", "sex", "year", "jiguang"],
					caps:["name", "sex", "year", "jiguang"]
				}				
			},
			show:{
				dft:{
					cols:["name", "sex", "year", "jiguang"],
					caps:["name", "sex", "year", "jiguang"]			
				},
				symptom:{
					cols:["symptoms:c"],
					caps:["symptom"]				
				}
			}						
		}	# controller		
	}	#VIEWS		
end