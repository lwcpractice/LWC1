trigger D1TriggerDemo on Account 
(After insert,After update,Before insert,Before update,Before delete,After Undelete) 
{
    switch on Trigger.OperationType 
    {
        when AFTER_INSERT 
        {
            AccountHandler.CreateContact();
            
        }
        when AFTER_UPDATE
        {
            AccountHandler.Deleterelated();
        }

        when BEFORE_INSERT
        {
            AccountHandler.SetAnnualRevenue();
        }

        when BEFORE_UPDATE
        {
            AccountHandler.SetAnnualRevenue();
            AccountHandler.setAccStatus();
        }

        when BEFORE_DELETE
        {
            AccountHandler.preventAccountDeletion();
            
        }

        when AFTER_UNDELETE
        {
            AccountHandler.setParentAccount();
            AccountHandler.setActiveStatus();
        }
    }
    

    

}