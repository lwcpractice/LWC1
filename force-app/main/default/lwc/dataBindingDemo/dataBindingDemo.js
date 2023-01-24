import { LightningElement } from 'lwc';

export default class DataBindingDemo extends LightningElement {

 firstname="sam";
 obj1={
    age:45,
    lastname:"lore",
    height:6.1,
    address:{
        city:"coimbatore",
        state:"Tamil nadu"
    }
 }

 fruits=["apple","orange","banana"];
 price1=20;
 display()
 {
    console.log(this.fruits);
 }
 get fruit()
 {
    return this.fruits[0];//getting array values using getter
 }

get price()
{
 return this.price1*30;//getting expression value using getter
}

handleEvent(event)
{  
   console.log(event.target.name)
   console.log(event.target.value)
   this.firstname=event.target.value
}


}