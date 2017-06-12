/**
 * Created by rowan.massey on 09/05/2017.
 */

@isTest
private class AnimalLocatorTest {

    @isTest
    static void testGetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(1);
        System.assert(name == 'bear');
    }
}