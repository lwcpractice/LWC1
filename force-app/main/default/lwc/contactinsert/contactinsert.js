import { LightningElement } from 'lwc';
import insertContactMethod from '@salesforce/apex/insertContact.insertContactMethod';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Contactinsert extends LightningElement {

lastname;
mobile;

handelChange(event)
{
    

    const{name,value}=event.target;
    if(name=="Lastname")
    {
        this.lastname=value;
        console.log('check vlue of lastname...'+this.lastname)
    }
    else if(name=="mobile")
    {
        this.mobile=value;
        console.log('check vlue of mobile...'+this.mobile)
    }

}

handelClick(event)
{
    if(event.target.name=='contactcreate')
    {
        insertContactMethod({Lastname:this.lastname,Mobile:this.mobile})
        .then((response)=>{
            const evnt=new ShowToastEvent(
                {
                    title:"Create Contact",
                    message:"Contact with "+response+" created successfully",
                    variant:"success"
                }
            )
            this.dispatchEvent(evnt);
        })
        .catch((error)=>{
            const evnt=new ShowToastEvent(
                {
                    title:"unable to create contact",
                    message:error,
                    variant:"error"
                }
            )
            this.dispatchEvent(evnt);

        })
    }
}

}