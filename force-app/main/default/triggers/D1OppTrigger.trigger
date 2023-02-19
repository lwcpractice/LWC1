trigger D1OppTrigger on Opportunity (after insert,after delete) 
{

    switch on Trigger.operationType 
    {
        when AFTER_INSERT 
        {
            OppHandeler.updateAccount();
        }
        when AFTER_DELETE
        {
            OppHandeler.setAccStatus();
        }
    }
    

}