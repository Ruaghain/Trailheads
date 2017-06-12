/**
 * Created by rowan.massey on 12/05/2017.
 */

global class LeadProcessor implements Database.Batchable<sObject> {

    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name, LeadSource FROM LEAD');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leads = new List<Lead>();

        for (Lead lead: scope) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
            recordsProcessed = recordsProcessed + 1;
        }

        update leads;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed. YEEEEOOOOOWWW!!');
    }
}