public with sharing class AccountHandler 
{
   public static void CreateContact()
   {

     List<Account> AccList = (List<Account>)Trigger.New;

     List<Contact> cList = new List<Contact>();
     for(Account a:AccList)
     {
        contact c = new contact ();
        c.LastName = a.Name+'contact';
        c.AccountId=a.Id;
        cList.add(c);
     }insert cList;


   }
}
