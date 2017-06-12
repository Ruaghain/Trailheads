/**
 * Created by rowan.massey on 11/05/2017.
 */

@IsTest
private class AccountProcessorTest {

    @IsTest
    static void testCountContacts() {
        List<Id> accountIds = new List<Id>();
        for (Integer i = 0; i <= 3; i++) {
            accountIds.add(createTestAccount('Account_' + i));
        }
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        Account returnedAccount = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :accountIds.get(0)];
    }

    static Id createTestAccount(String name) {
        Account accountTest = new Account(
                Name = name
        );
        insert accountTest;
        ID accountId = accountTest.Id;

        Contact contact1 = new Contact(FirstName = name + '_1', LastName = 'Person', Phone = '123456789', AccountId = accountId);
        insert contact1;

        Contact contact2 = new Contact(FirstName = name + '_2', LastName = 'Person', Phone = '234567890', AccountId = accountId);
        insert contact2;

        return accountId;
    }
}