public with sharing class dataFetchLwc 
{

@AuraEnabled(cacheable=true)
public static list<Account> dataFetchLwcMethod(string Industry) 
{
    List<Account> accList= new List<Account>();
	accList=[SELECT Name,Industry FROM Account WHERE Industry=:Industry];
    system.debug(accList);
    return [SELECT Name,Industry FROM Account WHERE Industry=:Industry];
    
}
}