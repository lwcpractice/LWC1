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

   public static void Deleterelated()
   {

    List<Account> accList=(List<Account>)Trigger.New;
    Set<Id> Accid = new Set<Id>();
    for(Account a:accList)
    { 
        if(a.Active__c=='No')
        {
            Accid.add(a.Id);
        }
    
        
    
    }

    List<Contact> cList=[SELECT id,LastName FROM CONTACT Where AccountId In:Accid];
    List<Opportunity> oppList =[SELECT Id FROM Opportunity WHERE AccountId In:Accid];
    Delete cList;
    Delete oppList;
   }

   public static void SetAnnualRevenue()
   {
        List<Account> accList=(List<Account>)Trigger.New;
        for(Account a:accList)  
        {
            if(a.rating=='Hot' && a.AnnualRevenue==null)
            {
                a.AnnualRevenue=100;
            }
        }
    

   }

   public static void setAccStatus ()
   {
    
    Map<Id,Account> oldaccmap = (Map<Id,Account>)Trigger.oldMap;

    Map<Id,Account> newaccmap = (Map<Id,Account>)Trigger.newMap;


    

    for(Id Accid:newaccmap.keyset())
    {
       if(oldaccmap.get(Accid).Rating=='Hot')
       {
            if( newaccmap.get(Accid).Rating=='Cold' && newaccmap.get(Accid).AnnualRevenue==null)
            {
                //newaccmap.put(Accid, new Account(Active__C='No'));

                newaccmap.get(Accid).active__c='No';
                

            }

       } 

   } 
    }



    public static void preventAccountDeletion()
    {
        List<Account> accList=(List<Account>)Trigger.Old;
        for(Account a:accList)
        {
            if(a.Rating=='Hot')
            {
                a.addError('cannot delete accout as rating is HOT');
            }
        }
    }


    public static void setParentAccount()
    {

        List<Account> accList=(List<Account>)Trigger.New;
        Map<Id,Account> newaccmap = (Map<Id,Account>)Trigger.newMap;

        Account ParentaccId =[SELECT Id,Name FROM Account WHERE Name ='GenePoint'];
        /*List<Account> NewaccList = new List<Account>();
        for(Account a:accList)
        {
            if (a.ParentId == null)
            {
                
                a.ParentId=ParentaccId.Id;
            }

            //NewaccList.add(a);
        }//update NewaccList;*/

        SET<Id> accid = new Set<Id>();
        for(Account a:accList)
        {
            accid.add(a.id);

        }

        List<Account> NewaccList =[SELECT Id,ParentId FROM Account WHERE Id in:accid];

        List<Account> New2accList = new List<Account>();
        for(Account a:NewaccList)
        {
            if (a.ParentId == null)
            {
                
                a.ParentId=ParentaccId.Id;
            }

            New2accList.add(a);
        }update New2accList;
    
        
    }


    public static void setActiveStatus()
    {

        List<Account> accList=(List<Account>)Trigger.New;
        
        SET<Id> accid = new Set<Id>();
        for(Account a:accList)
        {
            accid.add(a.id);

         }
         List<Account> NewaccList =[SELECT Id,ParentId FROM Account WHERE Id in:accid];

        List<Account> New2accList = new List<Account>();
        for(Account a:NewaccList)
        {
            a.active__C='Yes';

            New2accList.add(a);
        }update New2accList;
    


}
}
