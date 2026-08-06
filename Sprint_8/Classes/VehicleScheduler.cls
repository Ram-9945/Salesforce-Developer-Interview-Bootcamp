public class VehicleScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        System.debug('===== Scheduled Job Started =====');

        System.debug('Running Scheduled Vehicle Processing...');

        // Future business logic goes here

        System.debug('===== Scheduled Job Completed =====');
    }

}