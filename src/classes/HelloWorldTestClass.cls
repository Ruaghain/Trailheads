@IsTest
private class HelloWorldTestClass {
    static testMethod void testBehavior() {
        Book__c b = new Book__c(Name = 'Magician', price__c = 25.65);
        System.debug('Price before inserting new book: ' + b.price__c);

        insert b;

        b = [SELECT price__c FROM Book__c WHERE Id = :b.Id];
        System.debug('Price after inserting new book: ' + b.price__c);

        System.assertEquals(23.085, b.price__c);
    }
}