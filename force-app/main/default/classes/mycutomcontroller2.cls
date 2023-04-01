public class mycutomcontroller2 {
    
     public Account acc{get;set;}
    
  
    
    public mycutomcontroller2()
    {
       
       acc=new Account();
    }
    
    public void saveAccount()
    {
        insert acc;
       // return new PageReference('/'+acc.Id);
      // PageReference pg= new PageReference('https://www.google.com');
    //   pg.setRedirect(true);
       // return pg;
       
        
    }

}