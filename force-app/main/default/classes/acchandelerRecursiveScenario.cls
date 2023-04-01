public with sharing class acchandelerRecursiveScenario 
{
    //////////avoid recursive using static boolean variable//////////
    /*public static void accUpdate()
    {
        if(accountrecursivehandeler.istriggerexecuted)
        {
            accountrecursivehandeler.istriggerexecuted = false;
            List<Account> accList = (List<Account>)Trigger.new;
        set<Id> accId = new set<Id> ();
        for(Account a:accList)
        {
            accId.add(a.Id);
        }

        List<Account> NewaccList =[SELECT Id,Name FROM Account WHERE Id in:accId];
        List<Account> NewaccList2 = new List<Account> ();
        for(Account a:NewaccList)
        {
            a.active__c='NO';
            NewaccList2.add(a);

        }update NewaccList2;
        }
        

    }*/

 //////////avoid recursive using static set variable//////////
    public static void accUpdate()
    {
        List<Account> accList = (List<Account>)Trigger.new;
        Map<Id,Account> accMap = (Map<Id,Account>)Trigger.newMap;
        
           

            set<Id> accId = new set<Id> ();
            for(Account a:accList)
            {
                accId.add(a.Id);
               
            }
    
            List<Account> NewaccList =[SELECT Id,Name FROM Account WHERE Id in:accId];
            List<Account> NewaccList2 = new List<Account> ();
            for(Account a:NewaccList)
            {
                a.active__c='NO';
                NewaccList2.add(a);
    
            }
            
            for(Account a:accList)
            {
                
                if(!accountrecursivehandeler.TriggerExecutedAccId.contains(a.Id))
                {
                    
                    accountrecursivehandeler.TriggerExecutedAccId.add(a.Id);
                    update NewaccList2;
                }
                
            }
            
        }   
        


        
        

    
}