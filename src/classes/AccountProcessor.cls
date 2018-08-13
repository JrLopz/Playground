public with sharing class AccountProcessor {
    @future 
    public static void countContacts(set<id> setId){
        List<Account> ltAccount = [select id, Number_of_Contacts__c , (Select id From contacts) From account Where id in :setId];
        for (Account acco :ltAccount){
            List<Contact> ltConta = acco.contacts;
            acco.Number_of_Contacts__c = ltConta.size();
        }
        update ltAccount;
    }
}