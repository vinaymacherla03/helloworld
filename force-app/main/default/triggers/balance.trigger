/*if bank balance >10000, in comment section " You are Silver Customer.Please contact branch for new offers especially for you."

if bank balance >100000, in comment section " You are Gold Customer.Please contact branch for new offers especially for you."

if bank balance >1000000, in comment section " You are PlatinumCustomer.Please contact branch for new offers especially for you."

All the above rules shld be applicable if your account age is > 1year.*/

trigger balance on Customerinformation__c (after update) {
    for(Customerinformation__c obj:trigger.new)
    {
       Date dtDate =obj.Account_Opening__c ;
        Integer yr = dtDate.year();
        if(yr == 2022)
       {
           if(obj.Balance__c > 10000)// as per Balance 
           {
               obj.Comments__c = 'Your a Sliver customer Contact branch manger for more offers' ;
               Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               Messaging.SingleEmailMessage bye = new Messaging.SingleEmailMessage();
               List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
               List<String> sendTo = new List<String>();
                sendTo.add('vinaymacherla1999@gmail.com');
                bye.setToAddresses(sendTo);
                bye.setSubject('hello'); 
                bye.setHtmlBody('Byee');
 
                mail.setToAddresses(sendTo);
                mail.setSubject('Your contact detail are added'); 
                String body = 'obj.comment__c';
                mail.setHtmlBody(body);
                mails.add(mail);
                mails.add(bye);
                Messaging.sendEmail(mails);}  
            } 
           else if (obj.Balance__c > 1000000)
           {
               obj.Comments__c = 'Your a Gold customer Contact branch manger for more offers' ;  
           }
           else if (obj.Balance__c > 10000000)
           {
               obj.Comments__c = 'You are PlatinumCustomer.Please contact branch for new offers especially for you';
           }
       }    
    
}