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

}