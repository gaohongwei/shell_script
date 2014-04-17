var ready_symptom_type=function () {
  $('#disease_tokens').tokenInput('/symptoms.js', { 
  	crossDomain: false,
  	prePopulate: $("#disease_tokens").data("pre"),
  	theme: "facebook"  
  });	
};

$(document).ready(ready_symptom_type);
$(document).on('page:load', ready_symptom_type);
