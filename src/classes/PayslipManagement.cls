/**
 * Created by rowan.massey on 04/05/2017.
 */

@RestResource(UrlMapping='/Payslips/*')
global with sharing class PayslipManagement {

    @HttpGet
    global static Payslip__c doGet() {
        return new Payslip__c(Name = 'Payslip Yay!!');
    }
}