
@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager 
{
   
    @HttpGet
    global static Account getAccount()
    {
        RestRequest request = RestContext.request;
        String Accid = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account Acc = [SELECT Id, Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Id =:Accid];
        Return acc;

    }

    //rest api call:https://lwc168-dev-ed.develop.my.salesforce.com/services/apexrest/Account/0012w00001InyltAAB
}