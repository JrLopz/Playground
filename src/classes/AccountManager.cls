@RestResource(urlMapping='/Accounts/*/contacts')
global with Sharing class AccountManager {
   @httpGet
    global static Account getAccount(){
        
         RestRequest request=RestContext.request;
        System.debug('test'+request.requestURI);
         String accid= request.requestURI.substringBetween('Accounts/','/contacts');
        System.debug('test '+request.requestURI.substringBetween('Accounts/','/contacts'));
         Account acc=[Select id,name,(Select id, name from Contacts) from account where id=:accid];
        return acc;
    }
}