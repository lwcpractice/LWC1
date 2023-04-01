@isTest  with sharing class TestCallout {
    
    @isTest static void doStaticresourceTestForGetMethod()//////run test using static resource calloutMock
    {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('AnimalStatic');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        HttpResponse res = Restcalloutdemo.GetcalloutMethod();
        Test.stopTest();
        System.assertEquals(200, res.getStatusCode());
        AnimalParse animalObj =  AnimalParse.parse(res.getBody());
        List<String> Animals = animalObj.animals;
        System.assertEquals(4,Animals.size() );
    }

    @isTest static void doHttpcalloutMockTestForPostMethod()////run test using calloutmock interface implementation
    {
        Test.setMock(HttpCalloutMock.class, new AnimalHttpMock());
        Test.startTest();
        HttpResponse res = Restcalloutdemo.PostcalloutMethod();
        Test.stopTest();
        System.assertEquals(200, res.getStatusCode());
        AnimalParse animalObj =  AnimalParse.parse(res.getBody());
        List<String> Animals = animalObj.animals;
        System.assertEquals(5,Animals.size() );
        string mockresponse ='{"animals":["majestic badger","fluffy bunny","scary bear","chicken","vishahan"]}';
        System.assertEquals(mockresponse, res.getBody());

    }

}