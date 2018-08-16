public with sharing class agendaController {

    public static Alumno__c searchAlumno(String nombreAlumno) {
        return [Select Id from Alumno__c where Name =:nombreAlumno];    
    }

    public static Clase__c searchClase(String nombreClase){
        return [Select Id from Clase__c where Materia__c =:nombreClase];
    }
    @AuraEnabled
    public static List<Asistencia__c> getAllAsistencia(){
        return [Select Id, Name, Alumno__r.Name, Clase__r.Materia__c, Hora__c from Asistencia__c];
    }

    @AuraEnabled
    public static String agendar(String name, String materia, Datetime hora){
        try{
        Alumno__c alu = searchAlumno(name);
        Clase__c cl = searchClase(materia);
        Asistencia__c newas = new Asistencia__c(Clase__c=cl.Id, Alumno__c=alu.Id, Hora__c= hora);

        insert newas;

        }
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'Saved';
    }

    

}