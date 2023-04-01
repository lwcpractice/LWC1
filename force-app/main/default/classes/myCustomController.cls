public class myCustomController {
	
    public string Greeting{get;set;}
     public List<contact> customAccList{get;set;}
    
  
    
    public myCustomController()
    {
        Greeting='my cutom message welcome';
        customAccList=[SELECT ID,Name FROM contact];
    }
    
    
    
}