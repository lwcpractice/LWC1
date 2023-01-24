public with sharing class scriptdemocontroller {


    public string message{get;set;}
    public contact con{ get;set;}
    public scriptdemocontroller() {

    con= new contact();
	message='record';
    }

    public void createContact()
    {
        //insert con;
        this.message='record saved';
    }

}