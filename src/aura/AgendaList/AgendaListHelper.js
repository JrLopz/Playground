({
	createAgenda : function(component) {
		var action = component.get("c.agendar");
		var name = component.find("search-Alumno").get("v.value");
		var materia = component.find("search-Clase").get("v.value");
		var hora = component.get("v.tiempo");
		action.setParams({"name":name,"materia":materia,"hora":hora});
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === "SUCCESS") {
				var agn = response.getReturnValue();
				if(agn == 'Saved'){
					component.set('v.myAgenda', this.getAsistencias(component));
					alert('Guardado Corretamente');
				}
				else{
					alert('Error'+ agn);
				}
			}	
			else{
				console.log("Failed with state: " + state);			
			}
		});

		$A.enqueueAction(action);
   },

   getAsistencias: function(component){
	var action = component.get("c.getAllAsistencia");
	action.setCallback(this, function(response) {
		var state = response.getState();
		if (state === "SUCCESS") {
			console.log('respuesta '+JSON.stringify(response.getReturnValue()));

			var asistencias = response.getReturnValue();
			var flattenedList = [];
			asistencias.forEach(element => {
				flattenedList.push(this.flatten(element));
			});
			component.set('v.myAgenda', flattenedList);
		}
		else {
			console.log("Failed with state: " + state);
		}
	});
	$A.enqueueAction(action);
   },

   flatten: function(data) {
	var result = {};
	function recurse (cur, prop) {
		if (Object(cur) !== cur) {
			result[prop] = cur;
		} else if (Array.isArray(cur)) {
			 for(var i=0, l=cur.length; i<l; i++)
				 recurse(cur[i], prop + "[" + i + "]");
			if (l == 0)
				result[prop] = [];
		} else {
			var isEmpty = true;
			for (var p in cur) {
				isEmpty = false;
				recurse(cur[p], prop ? prop+"."+p : p);
			}
			if (isEmpty && prop)
				result[prop] = {};
		}
	}
	recurse(data, "");
	return result;
}
})