public with sharing class accountExtension {

    public string message{get;set;}
    public Account acc{get;set;}
    public accountExtension(ApexPages.StandardController std) {
       
        this.acc=(Account)std.getRecord();

    }

    public void display()
        {
<<<<<<< HEAD
            this.message= 'welcome to the the gu the hello all standard controller wih extension';
=======
            this.message= 'welcome to the the all the standard controller wih extension';
>>>>>>> mybranch1
        }



        
}
