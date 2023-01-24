import { LightningElement } from 'lwc';

export default class Day8OwnDemo extends LightningElement 
{

Number1;
Number2;
Result;

handelChange(event)
{
if(event.target.name=="n1"){this.Number1=event.target.value;}
if(event.target.name=="n2"){this.Number2=event.target.value;}

}
handelClick(event)
{
    if (this.Number1==null || this.Number2==null)
    {
        alert("please input two numbers for doing operations");
    }
    else
    {

        if(event.target.name=="b1")
        {
            this.Result=parseInt(this.Number1)+parseInt(this.Number2);
        }
    
        if(event.target.name=="b2")
        {
            this.Result=parseInt(this.Number1)-parseInt(this.Number2);
        }
    
        if(event.target.name=="b3")
        {
            this.Result=parseInt(this.Number1)/parseInt(this.Number2);
        }
    
        if(event.target.name=="b4")
        {
            this.Result=parseInt(this.Number1)*parseInt(this.Number2);
        }
    
        if(event.target.name=="b5")
        {
            this.Number1=null;
            this.Number2=null;
            this.Result=null;
        }

    }
   

}


}