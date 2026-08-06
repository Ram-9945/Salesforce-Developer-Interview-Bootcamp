public with sharing class BulkApplicationTriggerHandler {

    // ==========================================================
    // Before Insert
    // Sprint 17 - Bulk Validation
    // ==========================================================
    public static void beforeInsert(List<Application__c> applications) {

        ApplicationService.bulkValidateApplications(applications);

    }

    // ==========================================================
    // After Update
    // Sprint 18 - Process Selected Applications
    // ==========================================================
    public static void afterUpdate(
        List<Application__c> applications,
        Map<Id, Application__c> oldMap
    ) {

        ApplicationService.processSelectedApplications(
            applications,
            oldMap
        );

    }

}