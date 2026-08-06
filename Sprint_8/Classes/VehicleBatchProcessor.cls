public class VehicleBatchProcessor implements Database.Batchable<SObject> {

    // Step 1 - Select records
    public Database.QueryLocator start(Database.BatchableContext bc) {

        System.debug('===== Batch Started =====');

        return Database.getQueryLocator(
            'SELECT Id, Name FROM Vehicle__c'
        );
    }

    // Step 2 - Process each batch
    public void execute(Database.BatchableContext bc, List<Vehicle__c> scope) {

        System.debug('Processing Batch Size : ' + scope.size());

        for(Vehicle__c vehicle : scope){

            System.debug('Vehicle Name : ' + vehicle.Name);

            // Future business logic goes here

        }

    }

    // Step 3 - Finish
    public void finish(Database.BatchableContext bc){

        System.debug('===== Batch Completed Successfully =====');

    }

}