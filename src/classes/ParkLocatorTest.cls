/**
 * Created by rowan.massey on 10/05/2017.
 */

@isTest
private class ParkLocatorTest {
    @isTest
    static void testCountryCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> parks = ParkLocator.country('Germany');
        System.assertEquals(3, parks.size());
    }
}