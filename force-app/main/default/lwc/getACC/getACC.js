import { LightningElement,wire} from 'lwc';
import getAccountListMethod from '@salesforce/apex/getAccountList.getAccountListMethod';
import deleteAccount from '@salesforce/apex/deleteAccount.deleteAccountMethod';
import { deleteRecord } from 'lightning/uiRecordApi'; 
import{ ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class GetACC extends LightningElement 
{

    AccountList;
    jsRating;
    recid;
    value;
    statusoption=[

        {value:'Hot',
         label:'Hot',
        description:'highly important account' },
        {value:'Cold',
        label:'Cold',
        description:'not so important account' },
        {value:'Warm',
        label:'Warm',
         description:'important to some extent' }

    ];

    handelChange(event)
    {
        this.jsRating=event.detail.value;
    }
    handelClick(event)
    {
        if(event.target.name=='getaccount')
        {
            getAccountListMethod ({Rating:this.jsRating})
            .then((response)=>{
                console.log('check this rat response...........'+JSON.stringify(response));
                this.AccountList=response;
                const evnt=new ShowToastEvent(
                   {
                    title:'Fetch Account',
                    message:'Accounts fetched successfully',
                    variant:'success'
                   } 
                );
                this.dispatchEvent(evnt);
            })
            .catch((error)=>{
                console.log('check this rat response...........'+JSON.stringify(error));
            })
        }
        
    }


    handeldelete(event)
    {
        if(event.target.name=='accdel')
        {
            console.log('check out delete value..........'+event.target.value);
            console.log('check out delete value..........'+ event.target.name);
            this.recid=event.target.value;
            deleteRecord(event.target.value)
            .then((response)=>
            {
                console.log(JSON.stringify(response));
                const ent=new ShowToastEvent(
                    {
                        title:'delete record',
                        message:'record '+this.recid+'deleted successfully',
                        
                    }
                );
                this.dispatchEvent(ent);
                getAccountListMethod ({Rating:this.jsRating})
                .then((response)=>{
                    console.log('check this rat response...........'+JSON.stringify(response));
                    this.AccountList=response;
                    
                })
                .catch((error)=>{
                    console.log('check this rat response...........'+JSON.stringify(error));
                })

            })
            .catch((error)=>{
                console.log(JSON.stringify(error));
            })
        }
    }
    
        

}