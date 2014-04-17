var ready_symptom_select=function() {
	$("#select_part input:checkbox").change(function () {
		if ($(this).prop('checked')) {
			addSymptom($(this).val());
     } else {
			delSymptom($(this).val());
     }
     
  });
  function delSymptom(partID) {
  	dom='#part_id_'+partID
  	$(dom).remove();
  }

	function addSymptom(partID)
	{
		dst=$("#select_symptom");
		data_out={};
		data_out['part_id']=partID;
		url='/symptoms.js'
		div=$('<div/>',{id:'part_id_'+partID});
		div.append('</br>');				
		$.getJSON(url, data_out,function(symptoms) {
	  	$.each( symptoms, function( index, data ) { 		  		
	  		var cb = $('<input/>', {
	    				id:"disease_symptom_ids_",			   		
	    				name:"disease[symptom_ids][]",
	    				type:"checkbox",
	     				value:data.id,   	    				

					});  //var
	  		div.append(cb).append(data.name)
	  	}); 
	  	dst.append(div)
	  	//each
	  }); // getJSON
	}			// addSymptom
};

$(document).ready(ready_symptom_select);
$(document).on('page:load', ready_symptom_select);

