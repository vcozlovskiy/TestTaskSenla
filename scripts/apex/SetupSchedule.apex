AppointerLeadToQueueSchedule reminder = new AppointerLeadToQueueSchedule();
// Seconds Minutes Hours Day_of_month Month Day_of_week optional_year

String sch = '0 0 * * * *';
String jobID = System.schedule('Appoint leads to queue', sch, reminder);