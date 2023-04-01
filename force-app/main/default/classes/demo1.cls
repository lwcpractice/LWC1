public class demo1 {
    
   
    public static void execute()//using future method for setup objec DML operation
    {
        Account a= new Account();
        a.Name='sampleratty1';
        insert a;
        system.debug(a);
        
        seconexecute();
        
        
    }
     @future
    public static void seconexecute()
    {
        Profile p = [SELECT Id,Name FROM Profile WHERE Name='Standard User'];
        UserRole Ur=[SELECT Id,Name FROM UserRole WHERE Name='CEO'];
    
        User u = new User();
        u.LastName='demo1 user';
        u.Username='demmyywhite2022@qmail.com';
        u.Alias='demmy2';
        u.Email='demo@qmail.com';
        u.EmailEncodingKey='UTF-8';
        u.LanguageLocaleKey='en_US';
        u.LocaleSidKey='en_US';
        u.TimeZoneSidKey='America/Los_Angeles';
        u.ProfileId=p.Id;
        u.UserRoleId=ur.Id;
        
        insert u;
        
    }

}