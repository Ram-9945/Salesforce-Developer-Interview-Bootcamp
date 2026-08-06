trigger BulkApplicationTrigger on Application__c (
    before insert,
    after update
) {

    // Bulk Validation
    if (Trigger.isBefore && Trigger.isInsert) {
        BulkApplicationTriggerHandler.beforeInsert(Trigger.new);
    }

    // Process Selected Applications
    if (Trigger.isAfter && Trigger.isUpdate) {
        BulkApplicationTriggerHandler.afterUpdate(
            Trigger.new,
            Trigger.oldMap
        );
    }
}