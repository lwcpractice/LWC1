public with sharing class accountExtension {

    public string message{get;set;}
    public Account acc{get;set;}
    public accountExtension(ApexPages.StandardController std) {
       
        this.acc=(Account)std.getRecord();

    }

    public void display()
        {
            this.message= 'welcome to standard controller wih extension';
        }



        
}