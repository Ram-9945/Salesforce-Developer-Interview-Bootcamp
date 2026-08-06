public class VehicleBatchScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        System.debug('===== Vehicle Batch Scheduler Started =====');

        // Start the Batch Job
        Database.executeBatch(new VehicleBatchProcessor(), 5);

        System.debug('Vehicle Batch Job Submitted Successfully');

        System.debug('===== Vehicle Batch Scheduler Completed =====');

    }
}

//this sis a combination of Scheduled + Batch Apex classes