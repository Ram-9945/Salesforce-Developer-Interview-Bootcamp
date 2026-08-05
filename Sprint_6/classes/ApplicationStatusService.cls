public class ApplicationStatusService {

    // ==========================================================
    // Method Name : updateApplicationStatus
    // Purpose     : Update Application Status
    // Sprint      : US-11
    // ==========================================================
    public static void updateApplicationStatus(Id applicationId, String newStatus) {

        System.debug('======================================');
        System.debug('APPLICATION STATUS UPDATE STARTED');
        System.debug('======================================');

        // Retrieve Application
        Application__c application = [

            SELECT Id,
                   Student__r.Name,
                   Job__r.Name,
                   Applied_Under_Review_Selected_Rejected__c,
                   Remarks__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1

        ];

        // Display Current Details
        System.debug('Application Id : ' + application.Id);
        System.debug('Student Name   : ' + application.Student__r.Name);
        System.debug('Job Name       : ' + application.Job__r.Name);
        System.debug('Old Status     : ' + application.Applied_Under_Review_Selected_Rejected__c);

        // Update Status
        application.Applied_Under_Review_Selected_Rejected__c = newStatus;
        application.Remarks__c = 'Status Updated to ' + newStatus;

        try {

            update application;

            System.debug('--------------------------------------');
            System.debug('Application Status Updated Successfully');
            System.debug('New Status : ' + application.Applied_Under_Review_Selected_Rejected__c);
            System.debug('Remarks    : ' + application.Remarks__c);
            System.debug('--------------------------------------');

        }
        catch(Exception e){

            System.debug('Status Update Failed');
            System.debug(e.getMessage());

        }

        System.debug('======================================');
        System.debug('APPLICATION STATUS UPDATE COMPLETED');
        System.debug('======================================');

    }

}