public with sharing class AppointLeadToQueueBatch  implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) 
    {
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

        return Database.getQueryLocator('SELECT Id,	Total_Score__c, OwnerId '
        + 'FROM Lead '
        + 'WHERE Status = \'Open - Negotiations\' AND Total_Score__c > 3 AND OwnerId ' 
        + 'IN (SELECT Id FROM User WHERE ProfileId = \'' + adminProfile.Id + '\')'
        + 'ORDER BY	Total_Score__c DESC');
    }
    public void execute(Database.BatchableContext bc, List<Lead> leads)
    {
        GroupHelper helper = new GroupHelper();

        for(Lead l : leads)
        {
            l.OwnerId = helper.getGroupIdWithMinMembs();
        }
        
        update leads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Finish');
    }
}
