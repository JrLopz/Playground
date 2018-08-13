@istest
public class AddPrimaryContactTest {
    @istest
    static void TestList(){
        List<Account> Teste = new List<Account>();
        for (Integer i=0;i<50;i++){
            Teste.add(new Account (BillingState = 'CA', name = 'Test'+i));
        }
        for (Integer j=0;j<50;j++){
            Teste.add(new Account(BillingState= 'NY', name = 'Test'+j));
        }
        insert Teste;

        Contact cn = new Contact();
        cn.FirstName = 'Demo';
        cn.LastName = 'Demo';
        insert cn;
        String state = 'CA';

        AddPrimaryContact apc = new AddPrimaryContact(cn, state);
        Test.startTest();
            System.enqueueJob(apc);
        Test.stopTest();
    }
}