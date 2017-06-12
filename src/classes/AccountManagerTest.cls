/**
 * Created by rowan.massey on 11/05/2017.
 */

@IsTest
private class AccountManagerTest {

    @isTest
    static void testGetAccount() {
        Id recordId = createTestAccount();

        RestRequest request = new RestRequest();
        request.requestURI = 'https://eu11.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account data = AccountManager.getAccount();

        System.assert(data != null);
        System.assertEquals('Test Account 1', data.Name);
    }

    static Id createTestAccount() {
        Account accountTest = new Account(
                Name = 'Test Account 1',
                AccountNumber = '123456'
        );
        insert accountTest;
        ID accountId = accountTest.Id;

        Contact contact1 = new Contact(FirstName = 'One', LastName = 'Person', Phone= '123456789', AccountId = accountId);
        insert contact1;

        Contact contact2 = new Contact(FirstName = 'Two', LastName = 'Person', Phone= '234567890', AccountId = accountId);
        insert contact2;

        return accountId;
    }
}