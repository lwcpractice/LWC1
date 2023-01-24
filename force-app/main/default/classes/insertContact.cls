public with sharing class insertContact {

    @AuraEnabled
    public static string insertContactMethod(String Lastname,string Mobile) {
 
        contact c=new contact(Lastname=Lastname,MobilePhone=Mobile);
        insert c;
        return c.Id;


    }
}