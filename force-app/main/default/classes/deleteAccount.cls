public with sharing class deleteAccount {
    @AuraEnabled
    public static void deleteAccountMethod(string accId) {

        Account acc=[SELECT Id FROM Account where Id=:accID];
        delete acc;

    }
}