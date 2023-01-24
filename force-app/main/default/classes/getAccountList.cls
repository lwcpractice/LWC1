public with sharing class getAccountList {

    @AuraEnabled
    public static list<account> getAccountListMethod(string Rating) 
    {

        return[SELECT Name, Industry,Rating FROM Account WHERE Rating =:Rating];


    }
}