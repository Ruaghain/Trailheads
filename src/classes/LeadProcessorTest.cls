@IsTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 1; i <= 10; i++) {
            leads.add(new Lead(Status = 'Open_' + i, LeadSource = 'OldSource', LastName = 'Person_' + i, Company = 'Company_' + i));
        }
        insert leads;
    }

    @isTest
    static void test() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();

        Lead result = [SELECT Id, Name, LeadSource FROM LEAD LIMIT 1];
        System.assertEquals(result.LeadSource, 'Dreamforce');
    }
}