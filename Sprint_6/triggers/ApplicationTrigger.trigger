
//it is notification task

trigger ApplicationTrigger on Application__c (before insert, after update) {

    // Task 1
    if (Trigger.isBefore && Trigger.isInsert) {
        ApplicationService.validateApplications(Trigger.new);
    }

    // Task 2 & Task 3
    if (Trigger.isAfter && Trigger.isUpdate) {

        List<Application__c> selectedApplications = new List<Application__c>();
        List<Application__c> notificationApplications = new List<Application__c>();

        for (Application__c app : Trigger.new) {

            Application__c oldApp = Trigger.oldMap.get(app.Id);

            // Task 2
            if (oldApp.Applied_Under_Review_Selected_Rejected__c != 'Selected'
                && app.Applied_Under_Review_Selected_Rejected__c == 'Selected') {

                selectedApplications.add(app);
            }

            // Task 3
            if (oldApp.Applied_Under_Review_Selected_Rejected__c
                != app.Applied_Under_Review_Selected_Rejected__c) {

                notificationApplications.add(app);
            }
        }

        if (!selectedApplications.isEmpty()) {
            StatisticsService.updatePlacementStatistics(selectedApplications);
            
    
    AluminiService.notifyAluminiOffice(selectedApplications);  //// Task 4 only this line
        
        }

        if (!notificationApplications.isEmpty()) {
            NotificationService.sendNotification(notificationApplications);
        }

  

}
    }
