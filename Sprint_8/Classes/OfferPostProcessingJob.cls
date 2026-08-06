public class OfferPostProcessingJob implements Queueable {

    private Id offerId;

    public OfferPostProcessingJob(Id offerId) {
        this.offerId = offerId;
    }

    public void execute(QueueableContext context) {

        System.debug('===== Queueable Job Started =====');

        System.debug('Processing Offer Id : ' + offerId);

        // Simulating Background Tasks

        System.debug('Synchronizing with External System...');

        System.debug('Preparing Notifications...');

        System.debug('Generating Analytics...');

        System.debug('===== Queueable Job Completed =====');
    }
}