/**
 * Created by rowan.massey on 15/05/2017.
 */

global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext context) {
        List<Lead> leads = [SELECT Id, Company, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}