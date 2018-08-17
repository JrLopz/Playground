({
	doInit: function(component, event, helper) {
		helper.getAsistencias(component);

		component.set('v.columns', [
			{label: 'Nombre', fieldName: 'Name', type: 'number', sortable: true},
			{label: 'Clase', fieldName: 'Clase__r.Materia__c', type: 'Text'},
			{label: 'Alumno', fieldName: 'Alumno__r.Name', type: 'Text'},
			{label: 'Hora', fieldName: 'Hora__c', type: 'date'},
			{type: 'action', typeAttributes: {
				rowActions: [{ 
					label: 'Delete', name: 'delete' 
				}]
			}}
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

       // } 
	},

	handleRowAction: function (component, event, helper) {
		var action = event.getParam('action');
        var row = event.getParam('row');
		console.log('select row event', row);

		
		helper.removeBook(component, row)	
	}
})