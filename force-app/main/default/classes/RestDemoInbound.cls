
@RestResource(urlMapping='/RestInboundDemo/*')

global with sharing class RestDemoInbound 
{
    global class ResponseData
{
 global Account acc;
 global List<Contact> conList;
}

   @HttpGet
    global static ResponseData getAccountData()
    {
        //https:///lwc168-dev-ed.develop.my.salesforce.com/services/apexrest/RestInboundDemo/0012w00001ADF7hAAH
           RestRequest req= RestContext.request;
           system.debug('URL:' +req.requestURI);
           

           string url=req.requestURI;
           string accId= url.substring(url.lastIndexOf('/')+1);
           system.debug('accId :'+ accId);

          ResponseData res = new Responsedata();
          
          res.acc=[SELECT Id,Name,Industry FROM Account WHERE Id=:accId];
          res.conList=[SELECT Id,LastName FROM Contact WHERE AccountId=:accId];
          return res;
    }

    @HttpPost
    global static Account createAccount(string AccountName)
    {
        Account acc= new Account();
        acc.Name = AccountName;
        insert acc;
        return acc;
    }

}

