/**
 * Created by rowan.massey on 09/05/2017.
 */

public class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        String result = 'test';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> animal = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            result = (String)((Map<String, Object>)animal.get('animal')).get('name');
        }

        return result;
    }
}