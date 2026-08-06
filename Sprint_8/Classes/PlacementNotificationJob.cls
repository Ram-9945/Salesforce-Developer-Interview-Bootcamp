public class PlacementNotificationJob implements Queueable {

    private Id offerId;

    public PlacementNotificationJob(Id offerId) {
        this.offerId = offerId;
    }

    public void execute(QueueableContext context) {

        System.debug('===== Notification Job Started =====');

        System.debug('Offer Id : ' + offerId);

        System.debug('Preparing Notifications...');

        System.debug('Sending Email Notifications...');

        System.debug('===== Notification Job Completed =====');
    }
}