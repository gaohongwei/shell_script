var dyn_symptom=function () {
  $('#disease_tokens').tokenInput('/symptoms.js', { 
  	crossDomain: false,
  	prePopulate: $("#disease_tokens").data("pre"),
  	theme: "facebook"  
  });	
  $('#patient_tokens').tokenInput('/symptoms.js', { 
  	crossDomain: false,
  	prePopulate: $("#patient_tokens").data("pre"),
  	theme: "facebook"  
  });
	$("#select_part input:checkbox").change(function () {
		val=$(this).val();
		if ($(this).prop('checked')) {
			addCheckBox('symptom','/symptoms.js',{'part_id':val});
     } else {
			rmCheckbox(val,'part_id'); //remove dom by id #part_id_val
     }
     
  });  
};

$(document).ready(dyn_symptom);
$(document).on('page:load', dyn_symptom);
