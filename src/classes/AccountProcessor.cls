/**
 * Created by rowan.massey on 11/05/2017.
 */

public class AccountProcessor {

    @future
    public static void countContacts(List<Id> recordIds) {
        for (String id: recordIds) {

            AggregateResult contactCount = [SELECT COUNT(Id) recordCount FROM Contact WHERE AccountId =  :id];
            System.debug('Retrieved ' + contactCount.get('recordCount') + ' contacts for account with id ' + id);

            Account thisAccount = [SELECT Id FROM Account WHERE Id = :id];
            thisAccount.put('Number_of_Contacts__c', contactCount.get('recordCount'));

            update thisAccount;
        }
    }
}