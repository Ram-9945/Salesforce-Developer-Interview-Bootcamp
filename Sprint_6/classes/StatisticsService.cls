public class StatisticsService {

    public static void updatePlacementStatistics(List<Application__c> applications) {

        System.debug('===== PLACEMENT STATISTICS STARTED =====');

        Integer selectedCount = 0;

        for (Application__c app : applications) {

            if (app.Applied_Under_Review_Selected_Rejected__c == 'Selected') {

                selectedCount++;

                System.debug('Selected Application : ' + app.Id);
            }
        }

        System.debug('Total Selected Applications : ' + selectedCount);

        System.debug('===== PLACEMENT STATISTICS COMPLETED =====');
    }

}