import { LightningElement } from 'lwc';

export default class D8Owndemo2 extends LightningElement 

{
 
    custom;
    handelclick(event)
    {
      if  (event.target.name=="red")
      {
        this.custom="red";
      }
      else{
        this.custom="blue";
      }
    }


}