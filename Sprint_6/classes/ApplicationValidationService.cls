public class ApplicationValidationService {

    // ==========================================================
    // Method Name : checkDuplicate
    // Purpose     : Check Duplicate Application
    // Sprint      : US-9
    // ==========================================================
    public static Boolean checkDuplicate(Id studentId, Id jobId) {

        // Retrieve Existing Applications
        List<Application__c> applications = [

            SELECT Id,
                   Student__c,
                   Job__c,
                   Applied_Under_Review_Selected_Rejected__c
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId

        ];

        // Check Duplicate
        if (!applications.isEmpty()) {

            System.debug('======================================');
            System.debug('Duplicate Application Found.');
            System.debug('Application Already Exists.');
            System.debug('======================================');

            return true;
        }

        System.debug('======================================');
        System.debug('No Duplicate Application Found.');
        System.debug('Proceed to Create Application.');
        System.debug('======================================');

        return false;
    }

}