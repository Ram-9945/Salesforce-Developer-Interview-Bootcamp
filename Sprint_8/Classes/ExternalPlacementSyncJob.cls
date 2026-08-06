public class ExternalPlacementSyncJob implements Queueable {

    private Id offerId;

    public ExternalPlacementSyncJob(Id offerId) {
        this.offerId = offerId;
    }

    public void execute(QueueableContext context) {

        System.debug('===== External Sync Job Started =====');

        System.debug('Offer Id : ' + offerId);

        System.debug('Synchronizing with External Placement System...');

        System.debug('Synchronization Successful.');

        // Chain Job B
        System.enqueueJob(new PlacementNotificationJob(offerId));

        System.debug('Notification Job Submitted.');

        System.debug('===== External Sync Job Completed =====');
    }
}