public class AluminiService {

    // ==========================================================
    // Method Name : notifyAlumniOffice
    // Purpose     : Notify Alumni Office
    // Sprint      : US-16
    // ==========================================================
    public static void notifyAluminiOffice(List<Application__c> applications) {

        System.debug('======================================');
        System.debug('ALUMNI SERVICE STARTED');
        System.debug('======================================');

        for (Application__c app : applications) {

            System.debug('Alumni Office Notified');
            System.debug('Application Id : ' + app.Id);
            System.debug('Status : '
                + app.Applied_Under_Review_Selected_Rejected__c);
        }

        System.debug('======================================');
        System.debug('ALUMNI SERVICE COMPLETED');
        System.debug('======================================');
    }
}