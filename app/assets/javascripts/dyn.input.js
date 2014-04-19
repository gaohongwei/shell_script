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
function genId(id,group){
    group = group ||'group_id';
    return [group,id].join('_');
  }
  function rmCheckbox(id,group) {
    dom='#'+genId(id,group);
    $(dom).remove();
  }

  function addCheckBox(dataMode,url,queryData,parentObj)
  {
    //  Add checkboxes within #select_dataMode 
    firstKey=Object.keys(queryData)[0]; 
    queryId=queryData[firstKey];
    domGroup=firstKey; // use the first key as group name
    model=dataMode;
    dstId="#select_"+model; // #select_symptom is a dom
    dst=$(dstId);
    // Get checkbox id and name
    formId=dst.closest('form').attr('id'); // edit_symptom_1
    arr=formId.split('_');
    objName=arr[1];
    parentObj=objName;
    cbId=[objName,model,"ids"].join('_');
    cbName=objName.concat("[",model,"_ids][]");
    // Get checkbox id and name, end  
    //This dom id should match 
    div=$('<div/>',{id:genId(queryId,domGroup)});
    div.append('</br>');        
    $.getJSON(url, queryData,function(data_returned) {
      $.each( data_returned, function( index, data ) {          
        var cb = $('<input/>', {
              id:cbId,            
              name:cbName,
              type:"checkbox",
              value:data.id,                

        });  //var
        div.append(cb).append(data.name);
      }); //each
      dst.append(div);      
    }); // getJSON
  }     // addSymptom   

};

$(document).ready(dyn_symptom);
$(document).on('page:load', dyn_symptom);
