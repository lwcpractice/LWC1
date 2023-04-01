public with sharing class Restcalloutdemo 
{
    //@future(callout=true)
    public static HttpResponse GetcalloutMethod()
    {
        Http http = new Http();
        HttpResponse httpResponse = new HttpResponse();
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        httpRequest.setMethod('GET');
        httpResponse=http.send(httpRequest);
        if(httpResponse.getStatusCode()==200)
        {
            System.debug(httpResponse);
            system.debug(httpResponse.getBody());
           AnimalParse animalObj =  AnimalParse.parse(httpResponse.getBody());
           //system.debug(animalObj.animals);
           List<String> Animals = animalObj.animals;
           for(String animal:Animals)
           {
            system.debug(animal);
           }

            
        }

        else 
        {
            System.debug('some problem in fetching the response');
        }

        return httpResponse;

        
        
    }

    //@future(callout=true)
    public static HttpResponse PostcalloutMethod()
    {
        Http http = new Http ();
        HttpRequest httpRequest = new HttpRequest();
        HttpResponse httpResponse = new HttpResponse();
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        httpRequest.setHeader('Content-Type', 'application/json;charset=UTF-8');
        httpRequest.setBody('{"name":"vishahan"}');
        httpRequest.setMethod('POST');
        httpResponse = http.send(httpRequest);
        if(httpResponse.getStatusCode()==201)
        {
            System.debug(httpResponse);
            //system.debug(httpResponse.getBody());
           AnimalParse animalObj =  AnimalParse.parse(httpResponse.getBody());
           //system.debug(animalObj.animals);
           List<String> Animals = animalObj.animals;
           for(String animal:Animals)
           {
            system.debug(animal);
           }

            
        }

        else 
        {
            System.debug('some problem in fetching the response');
        }

        return httpResponse;

    }

    

   
}