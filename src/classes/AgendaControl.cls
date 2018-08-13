public class AgendaControl {
    public Asistencia__c asistencia;
    public Alumno__c alumno;
    public Clase__c clase;
    public datetime hora {get; set;}
    
    public Asistencia__c getAsistencia(){
        asistencia = [Select Name, Hora__c, Alumno__r.Name, Clase__r.Materia__c FROM Asistencia__c limit 1 ];
        return asistencia;      
    }
    
    public Alumno__c getAlumno(){
        Alumno__c alumno = [Select Name FROM Alumno__c limit 1];
        return alumno;
    }
    
    public Clase__c getClase(){
        Clase__c clase = [Select Materia__c FROM Clase__c limit 1];
        return clase;
    }
    
    public PageReference save(){
        Datetime dt = Datetime.newInstance(1960, 2, 17);
        //Asistencia__c asist = new Asistencia__c(Clase__c.this.clase, Alumno__c.this.alumno, Hora__c=dt);
        insert asistencia;
        asistencia = new Asistencia__c();
        return null;        
    }
}