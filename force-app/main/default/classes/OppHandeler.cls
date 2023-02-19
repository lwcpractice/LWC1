public with sharing class OppHandeler 
{
    public static void updateAccount()
    {
        
        List<Opportunity> oppList = (List<Opportunity>)Trigger.New;
        Set<Id> Accid = new Set<Id>();
        for(Opportunity o:oppList)
        {
            Accid.add(o.AccountId);
        }

        List<Account> accList = new List<Account>();
        List<aggregateResult> agrResults =[SELECT AccountId,MAX(Amount) Highvalue FROM Opportunity WHERE AccountId in:Accid group by AccountId];
        for(aggregateResult agrResult:agrResults)
        {
            Account acc= new Account();
           acc.Highopp_value__c=(decimal)agrResult.get('Highvalue');
           acc.Id =(Id)agrResult.get('AccountId');
           accList.add(acc);

        }update accList;



    }

    public static void setAccStatus()
    {
        List<Opportunity> oppList = (List<Opportunity>)Trigger.Old;
        Map<Id,Opportunity> oppMap = (Map<Id,Opportunity>)Trigger.OldMap;
        Set<Id> oppAccId = new Set<Id>();
        for(Opportunity o:oppList)
        {
            oppAccId.add(o.AccountId);
        }
    
       Map<Id,Account> accMap = New Map<Id,Account>([SELECT Id,Active__c FROM Account WHERE Id in:oppAccId]);
       List<Account> accList  =[SELECT Id,Active__c FROM Account WHERE Id in:oppAccId ];
       
       List<Account> AccNewList= new List<Account> ();

       ///refactor required////////////
            for(Account a:AccList)
            {
               integer number1= [select count() FROM Opportunity WHERE AccountId =:a.Id];
                if(number1 ==0)
                {
                    a.Active__c='No';
                    AccNewList.add(a);
                }
            }update AccNewList;

       /*for(Account a:accList)
       { 



            if(oppMap.get(a.id).size()==0)
            {
                a.active__c='No';
                
                AccNewList.add(a);
                

            }
        

       } update AccNewList;*/


       


   }




        
    }
    
