public class NotificationService {

    // ==========================================================
    // Method Name : sendNotification
    // Purpose     : Send Notification for Status Changes
    // Sprint      : US-15
    // ==========================================================
    public static void sendNotification(List<Application__c> applications) {

        System.debug('======================================');
        System.debug('NOTIFICATION SERVICE STARTED');
        System.debug('======================================');

        for (Application__c app : applications) {

            System.debug('Notification Sent');
            System.debug('Application Id : ' + app.Id);
            System.debug('Current Status : ' +
                app.Applied_Under_Review_Selected_Rejected__c);

        }

        System.debug('======================================');
        System.debug('NOTIFICATION SERVICE COMPLETED');
        System.debug('======================================');
    }
}