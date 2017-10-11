@isTest
global class MR_WeatherMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond ( HTTPRequest req ) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        system.debug( req.getEndpoint() );
        system.debug( req.getMethod() );
        System.assertEquals( 'https://api.openweathermap.org/data/2.5/weather?q=Sai Gon&appid=ea77eec72392d5163c6c06be812dff37', req.getEndpoint() );
        System.assertEquals( 'GET', req.getMethod() );

        // Create a fake response
        HttpResponse res = new HttpResponse();
       
        /*
            json sample
            {
                'coord' : {
                    'lon' : 5,
                    'lat' : 15
                }
            }
        */
        res.setBody( '{ \'coord\' : { \'lon\' : 5, \'lat\' : 15 }}' );
        res.setStatusCode( 100 );
        return res;
    }
}