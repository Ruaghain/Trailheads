public class ParkLocator {

    public static List<String> country(String country) {
        ParkService.ParksImplPort parksService = new ParkService.ParksImplPort();
        return parksService.byCountry(country);
    }
}