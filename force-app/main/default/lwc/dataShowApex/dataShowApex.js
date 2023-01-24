import { LightningElement,wire } from 'lwc';
import dataFetchLwcMethod from '@salesforce/apex/dataFetchLwc.dataFetchLwcMethod';

export default class DataShowApex extends LightningElement 
{

accList;
Instry='Energy';
@wire(dataFetchLwcMethod,{Industry:'$Instry'})
datashow({data,error})
{
    if(data)
    {
        this.accList=data;
        console.log('check it..............................'+JSON.stringify(this.accList));
    }

    else if(error)
    {
        console.log('error in fetching data...............................'+JSON.stringify(error));
    }
    
}



}