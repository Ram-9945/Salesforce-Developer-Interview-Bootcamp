public class OfferFutureHandler {

    @future
    public static void processOfferAsync(Id offerId) {

        System.debug('===== Future Method Started =====');

        System.debug('Processing Offer Id : ' + offerId);

        // Simulate background work

        System.debug('Sending data to External System...');

        System.debug('Preparing Notifications...');

        System.debug('Updating Analytics...');

        System.debug('===== Future Method Completed =====');
    }
}