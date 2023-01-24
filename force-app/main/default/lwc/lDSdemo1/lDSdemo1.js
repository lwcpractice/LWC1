import { LightningElement,api,wire,track} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
export default class LDSdemo1 extends LightningElement {

   
userodaID=Id;
UserodaDetails;
@wire(getRecord,{recordId:'$userodaID',layoutTypes:'Full'})
getContactRecord({data,error})
{ 
    if(data)
    {
        console.log('wire method called');
       
        
        this.UserodaDetails=data.fields;
        console.log('check out fields.....'+JSON.stringify(this.UserodaDetails));
        

    }
    
}

}