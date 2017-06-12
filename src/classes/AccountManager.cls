/**
 * Created by rowan.massey on 10/05/2017.
 */

@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;

        Integer lastSlash = request.requestURI.lastIndexOf('/');
        String resultString = request.requestURI.substring(0, lastSlash - 1);
        Integer idSlash = resultString.lastIndexOf('/');

        String accountId = request.requestURI.substring(idSlash + 1, lastSlash);

        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Account.Contacts) FROM Account WHERE Id = :accountId];

        return result;
    }
}