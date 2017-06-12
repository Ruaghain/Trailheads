@IsTest
private class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            if (i < 50) {
                accounts.add(new Account(name = 'Test Account ' + i, BillingState = 'NY'));
            } else {
                accounts.add(new Account(name = 'Test Account ' + i, BillingState = 'CA'));
            }
        }
        insert accounts;
    }

    @isTest
    static void testQueueable() {
        Contact contact = new Contact(FirstName = 'One', LastName = 'Person');
        AddPrimaryContact updateContact = new AddPrimaryContact(contact, 'CA');
        Test.startTest();
        System.enqueueJob(updateContact);
        Test.stopTest();
        List<Account> accounts = [SELECT Id, (SELECT FirstName, LastName FROM Contacts) FROM Account WHERE BillingState = 'CA'];
        for(Account account: accounts) {
            System.assertEquals(account.Contacts.get(0).FirstName, 'One');
            System.assertEquals(account.Contacts.get(0).LastName, 'Person');
        }
    }
}