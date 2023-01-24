public with sharing class demoAny {
    public demoAny() {

account acc=[SELECT Id,Name FROM Account LIMIT 1];
system.debug(acc);


    }
}