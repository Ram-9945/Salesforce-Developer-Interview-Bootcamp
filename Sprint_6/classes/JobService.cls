public class JobService {

    // ==========================================================
    // Method Name : getJobDetails
    // Purpose     : Retrieve Job Details using SOQL
    // Sprint      : US-8
    // ==========================================================
    public static void getJobDetails(Id jobId) {

        // Retrieve Job Record
        Job__c job = [
            SELECT Id,
                   Name,
                   Company_Name__c,
                   Min_cgpa__c,
                   Salary__c,
                   Location__c,
                   Closing_Date__c,
                   Status__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        // Display Job Details
        System.debug('======================================');
        System.debug('        JOB INFORMATION');
        System.debug('======================================');
        System.debug('Job Id           : ' + job.Id);
        System.debug('Job Name         : ' + job.Name);
        System.debug('Company Name     : ' + job.Company_Name__c);
        System.debug('Minimum CGPA     : ' + job.Min_cgpa__c);
        System.debug('Salary           : ' + job.Salary__c);
        System.debug('Location         : ' + job.Location__c);
        System.debug('Closing Date     : ' + job.Closing_Date__c);
        System.debug('Status           : ' + job.Status__c);
        System.debug('======================================');

    }

}