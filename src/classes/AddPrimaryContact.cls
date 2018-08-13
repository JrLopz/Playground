public class AddPrimaryContact implements Queueable {
    private Contact c;
    private String state;

    public AddPrimaryContact (Contact c, String state){
        this.c = c;
        this.state = state;
    }
    public void execute(QueueableContext context){
        List<Account> ltAccount = [SELECT ID, Name,(Select id,FirstName,LastName From Contacts)
        From Account Where BillingState = :state LIMIT 200];
        List<Contact> ltContact = new List<Contact>();
        for (Account ac:ltAccount){
            Contact cn = c.clone(false, false, false, false);
            cn.AccountId = ac.id;
            ltContact.add(cn);
        }
        if (ltContact.size()>0){
            insert ltContact;
        }
    }
}