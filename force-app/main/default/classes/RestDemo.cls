public with sharing class RestDemo {
   
//1.add remote site settings
//2.add custom label
//3.Httprequest
//4.Http
//5.HttpResponse
//6.JSON

public static void getAnimalDetails()
{
    string endPoint=System.Label.AnimalDetails;
    HttpRequest req= new HttpRequest();
    Http http = new Http();
    HttpResponse response = new HttpResponse();

    req.setEndpoint(endpoint);//set end point
    req.setMethod('GET');//set method of data parsing

    try{

       response = http.send(req);

       if(response.getStatusCode()==200)
       {
            string body = response.getBody();
            system.debug('RESPONE BODY:  '+body);

            //system.debug(JSON2Apex.parse(body));

            JSON2Apex MapResponse = JSON2Apex.parse(body);

            //system.debug(MapResponse.animals);
            list<string> animals = MapResponse.animals;
            for(string animal:animals)
            {
                system.debug(animal);
            }

       }

       else{
        system.debug('ERROR CODE RETURNED: '+ response.getStatusCode());
       }
    }

    catch(Exception e)
    {
        system.debug(e.getMessage());
    }

}


}