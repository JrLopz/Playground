public class Agenda {
    public List<Asistencia__c> asistencia;
    public Alumno__c alumno;
    public Clase__c materia;
    public Datetime hora { get; set; }
    
    public List<Asistencia__c> getAsistencia(){
        List<Asistencia__c> asistencia = [SELECT Id, Name, Hora__c, Alumno__r.Name, Clase__r.Materia__c FROM Asistencia__c];
        this.asistencia = asistencia;
        return asistencia;
    }  

   //Metodo Alumno  
    public Alumno__c getAlumno(){
        Alumno__c alumno = [Select Name,Id FROM Alumno__c limit 1];
        this.alumno = alumno;
        return alumno;
    }   
    
    //Metodo Materia-Clase
    public Clase__c getMateria(){
        Clase__c materia = [Select Materia__c, Id FROM Clase__c limit 1];
        this.materia = materia;
        
        return materia;
    } 

    public PageReference save(){ 
        Datetime dt = Datetime.newInstance(1960, 2, 17);
        
        System.debug('debug: '+materia);
       Asistencia__c asist = new Asistencia__c(Clase__c=materia.Id, Alumno__c=alumno.Id, Hora__c=dt);
        
       insert asist;
        
      /*  PageReference home = new PageReference('/apex/Agenda');
        home.setRedirect(true);  */     
        return null; 
        
    }
}