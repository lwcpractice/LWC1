trigger D1TriggerDemo on Account (After insert) 
{
    AccountHandler.CreateContact();

    

}