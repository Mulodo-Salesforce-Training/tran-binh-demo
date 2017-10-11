@isTest
private class MR_CandidateWeatherControllerTest {
	@isTest static void weatherMethod() {

		// set mock callout class
        Test.setMock( HttpCalloutMock.class, new MR_WeatherMock() );

        // create & insert a new Candidate to get Id & City(Location)
		Candidate__c can = new Candidate__c( City__c = 'Sai Gon' );

		insert can;

		// Put Id to page
		ApexPages.currentPage().getParameters().put( 'id', can.Id );

		// Define new instance for testing
		MR_CandidateWeatherController cwbl = new MR_CandidateWeatherController();

		MR_CandidateWeatherController.WeatherInfoDao wid = cwbl.weatherInfo;

		System.assertEquals( 5, wid.Coord.lon );
		System.assertEquals( 15, wid.Coord.lat );
		System.assertEquals( 'Sai Gon', can.City__c );
	}
}