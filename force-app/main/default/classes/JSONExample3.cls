public class JSONExample3 {
  
    string email;
    Address address;  
        public static void fetchdata()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users');
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        if(response.getStatusCode() == 200) 
        {      
            //List<Object>results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            //System.debug()
             JSONParser   ob = JSON.createParser(response.getBody());
             System.debug(ob);
             while (ob.nextToken() != null) 
                   if (ob.getCurrentToken() == JSONToken.START_ARRAY) {
                          while (ob.nextToken() != null) { 
                              if (ob.getCurrentToken() == JSONToken.START_OBJECT)
                              {
                                  JSONExample3 z=(JSONExample3)ob.readValueAs(JSONExample3.class);
                                  System.debug(z.email);
                              }
                         }
                   }
             }
        }        

    }