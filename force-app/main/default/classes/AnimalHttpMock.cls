@isTest global class AnimalHttpMock implements HttpCalloutMock 
{

    global HttpResponse respond(HttpRequest Request)
    {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken","vishahan"]}');
        return response;

    }
    

   
}