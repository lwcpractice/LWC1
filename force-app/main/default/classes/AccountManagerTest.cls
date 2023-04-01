@isTest class AccountManagerTest 
{
    @isTest static void doTest()
    {
        Id accId = Makedata();
        RestRequest request = new RestRequest();
        request.requestURI ='https://lwc168-dev-ed.develop.my.salesforce.com/services/apexrest/Account/'+accId;
        request.httpMethod='GET';
        RestContext.request= request;
        Account acc= AccountManager.getAccount();
        System.assertEquals('sampleratacc0', acc.Name);
        List<Contact> cList =[SELECT Id,name FROM CONTACT WHERE AccountId=:accId];
        System.assertEquals(3, cList.size());

    }
    
    @isTest static Id Makedata()
    {

        for(integer i=0;i<1;i++)
        {
            Account acc= new Account(Name='sampleratacc'+i);
            insert acc;
            for(integer j=0;j<3;j++)
            {
                Contact c = new Contact(AccountId= acc.Id, LastName='samplecontact'+ j);
                insert c;
            }
        }

        

      Account acc =[SELECT ID FROM Account LIMIT 1];
        Return acc.id;

    }
}