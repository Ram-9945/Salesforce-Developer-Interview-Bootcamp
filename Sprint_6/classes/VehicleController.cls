public with sharing class VehicleController {

    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicles() {

        return [
            SELECT Name,
                   Customer_Name__c,
                   Vehicle_Number__c
            FROM Vehicle__c
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Vehicle__c getVehicleById(Id recordId){

        return [
            SELECT Id,
                   Customer_Name__c,
                   Vehicle_Number__c
            FROM Vehicle__c
            WHERE Id = :recordId
            LIMIT 1
        ];
    }
}