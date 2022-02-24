public class Testingmail {
    public static void main ()
    {
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