trigger Vochers on Customerinformation__c (before insert) {

    for(Customerinformation__c   obj: trigger.new)
    {
      if(obj.Type_of_Account__c == 'Salary')
      {
          integer intrandomNumber = Integer.valueOf((math.random()*1000));
          obj.Balance__c = obj.Balance__c +50;
          obj.Comments__c = 'You have won a vocher of Rs 50'+intrandomNumber;
            
        
    }
     
    }
}