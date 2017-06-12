/**
 * Created by rowan.massey on 15/05/2017.
 */

@IsTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Person_' + i, Company = 'Company_' + i));
        }
        insert leads;
    }

    @isTest
    static void testSchedule() {
        Test.startTest();
        System.schedule('ScheduledLeadProcessing', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}