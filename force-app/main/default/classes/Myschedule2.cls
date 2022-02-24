global class Myschedule2 implements Schedulable{
    global void execute(SchedulableContext sc){
        HelperScheduler.display();
    }
}