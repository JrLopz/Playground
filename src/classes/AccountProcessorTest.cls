@isTest
public with sharing class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact con = new Contact();
        con.FirstName = 'Javi';
        con.LastName = 'Lopez';
        con.AccountId = a.Id;
        Insert con;
        
        set<Id> setAccoId = new set<ID>();
        setAccoId.add(a.id);

        Test.startTest();
            AccountProcessor.countContacts(SetAccoId);
        Test.stopTest();

        Account ac = [Select Number_of_Contacts__c From Account Where id = :a.id LIMIT 1];
        System.assertEquals(Integer.valueOf(ac.Number_of_Contacts__c) ,1);
    }

}