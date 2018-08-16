({
	doInit: function(component, event, helper) {
		helper.getAsistencias(component);

		component.set('v.columns', [
			{label: 'Nombre', fieldName: 'Name', type: 'autonumber'},
			{label: 'Clase', fieldName: 'Clase__r.Materia__c', type: 'Text'},
			{label: 'Alumno', fieldName: 'Alumno__r.Name', type: 'Text'},
			{label: 'Hora', fieldName: 'Hora__c', type: 'date'}
		]);
	},

	submitForm : function(component, event, helper) {
		/*var validAgenda = true;
		var Alum = component.find("search-Alumno");
        var xAlum = Alum.get("v.value");
        if ($A.util.isEmpty(xAlum)){
            validAgenda = false;
            Alum.set("v.errors", [{message:"The Alumn name can't be blank."}]);
        }
        else {
            Alum.set("v.errors", null);
		}

		var cl = component.find("search-Clase");
		var xcl = cl.get("v.value");
		if ($A.util.isEmpty(xcl)){
			validAgenda = false;
			cl.set("v.errors", [{message:"The class name can´t be blank"}])
		}
		else {
			cl.set("v.errors",null);
		}

		if(validAgenda){*/
			helper.createAgenda(component);
			//window.location.reload();

       // } 
	},
	/*
	handleKeyUp: function (cmp, evt) {
        var isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            var queryTerm = cmp.find('enter-Clase').get('v.value');
            alert('Searched for "' + queryTerm + '"!');
        }
    }*/
	
})

