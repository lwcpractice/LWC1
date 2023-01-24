public with sharing class mychildcontroller {

    public string userName{get;set;}
    public mychildcontroller() {

        this.userName= UserInfo.getFirstName();
    }
}