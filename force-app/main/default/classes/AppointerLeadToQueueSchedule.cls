public class AppointerLeadToQueueSchedule implements Schedulable {
    public void execute(SchedulableContext ctx) {
        AppointLeadToQueueBatch batch = new AppointLeadToQueueBatch();
        Database.executeBatch(batch);
    }
}
