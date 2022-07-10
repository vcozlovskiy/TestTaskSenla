public with sharing class AppointLeadToQueue  implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator('SELECT Id FORM Lead WHERE Status == \'Open - Negotiations\'');
    }
    public void execute(Database.BatchableContext bc, List<Lead> records)
    {
        for(Lead tempLead : records)
        {
            System.debug(tempLead.Id);
        }
        // process each batch of records
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}
