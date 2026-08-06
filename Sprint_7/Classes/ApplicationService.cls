public class ApplicationService {

    // ==========================================================
    // Method Name : submitApplication
    // Purpose     : Create a New Application
    // Sprint      : US-10
    // ==========================================================
    public static void submitApplication(Id studentId, Id jobId) {

        System.debug('======================================');
        System.debug('APPLICATION PROCESS STARTED');
        System.debug('======================================');

        Boolean isDuplicate =
            ApplicationValidationService.checkDuplicate(studentId, jobId);

        if (isDuplicate) {
            return;
        }

        Student__c student = [
            SELECT Id, Name
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id, Name
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        Application__c application = new Application__c();

        application.Student__c = student.Id;
        application.Job__c = job.Id;
        application.Applied_Under_Review_Selected_Rejected__c = 'Applied';
        application.Application_Dates__c = Date.today();
        application.Remarks__c = 'Application Submitted Successfully';

        try {

            insert application;

            System.debug('======================================');
            System.debug('Application Submitted Successfully');
            System.debug('Application Id : ' + application.Id);
            System.debug('Student : ' + student.Name);
            System.debug('Job : ' + job.Name);
            System.debug('======================================');

        } catch (Exception e) {

            System.debug('Application Creation Failed');
            System.debug(e.getMessage());

        }

        System.debug('APPLICATION PROCESS COMPLETED');
    }

    // ==========================================================
    // Method Name : validateApplications
    // Purpose     : Validate Applications Before Insert
    // Sprint      : US-13
    // ==========================================================
    public static void validateApplications(List<Application__c> applications) {

        System.debug('===== APPLICATION VALIDATION STARTED =====');

        for (Application__c app : applications) {

            if (app.Student__c == null) {
                app.addError('Student is required.');
            }

            if (app.Job__c == null) {
                app.addError('Job is required.');
            }

            System.debug('Validated Application');
        }

        System.debug('===== APPLICATION VALIDATION COMPLETED =====');
    }


    // ==========================================================
// Method Name : bulkValidateApplications
// Purpose     : Sprint 17 - Bulk Eligibility Validation
// ==========================================================
public static void bulkValidateApplications(List<Application__c> applications) {

    if(applications == null || applications.isEmpty()){
        return;
    }

    Set<Id> studentIds = new Set<Id>();
    Set<Id> jobIds = new Set<Id>();

    for(Application__c app : applications){

        if(app.Student__c != null){
            studentIds.add(app.Student__c);
        }

        if(app.Job__c != null){
            jobIds.add(app.Job__c);
        }

    }

    Map<Id, Student__c> studentMap =
        new Map<Id, Student__c>([
            SELECT Id,
                   Cgpa__c,
                   Back__c,
                   Status__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

    Map<Id, Job__c> jobMap =
        new Map<Id, Job__c>([
            SELECT Id,
                   Min_cgpa__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);

    for(Application__c app : applications){

        Student__c stu = studentMap.get(app.Student__c);
        Job__c job = jobMap.get(app.Job__c);

        if(stu == null || job == null){
            continue;
        }

        if(stu.Cgpa__c >= job.Min_cgpa__c){

            app.Applied_Under_Review_Selected_Rejected__c = 'Under Review';

        }else{

            app.Applied_Under_Review_Selected_Rejected__c = 'Rejected';
            app.Remarks__c = 'CGPA is below minimum requirement';

        }

    }

}

// ==========================================================
// Method Name : processSelectedApplications
// Purpose     : Sprint 18 - Bulk Update Student Status
// ==========================================================
public static void processSelectedApplications(
    List<Application__c> newApplications,
    Map<Id, Application__c> oldMap
) {

    if(newApplications == null || newApplications.isEmpty()){
        return;
    }

    Set<Id> studentIds = new Set<Id>();

    for(Application__c app : newApplications){

        Application__c oldApp = oldMap.get(app.Id);

        if(
            oldApp != null &&
            app.Applied_Under_Review_Selected_Rejected__c == 'Selected' &&
            oldApp.Applied_Under_Review_Selected_Rejected__c != 'Selected' &&
            app.Student__c != null
        ){
            studentIds.add(app.Student__c);
        }
    }

    if(studentIds.isEmpty()){
        return;
    }

    List<Student__c> studentsToUpdate = [
    SELECT Id,
           Status__c,
           Back__c
    FROM Student__c
    WHERE Id IN :studentIds
];

    for(Student__c stu : studentsToUpdate){
    stu.Status__c = 'Selected';
}

update studentsToUpdate;
}



}