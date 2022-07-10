public class AppointLeadToQueueBatch  implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) 
    {
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        return Database.getQueryLocator('SELECT Id,	Total_Score__c, OwnerId '
        + 'FROM Lead '
        + 'WHERE Status = \'Open - Negotiations\' AND Total_Score__c > 3 AND OwnerId ' 
        + 'IN (SELECT Id FROM User WHERE ProfileId = \'' + adminProfile.Id + '\')'
        + 'ORDER BY	Total_Score__c DESC');
    }
    public void execute(Database.BatchableContext bc, List<Lead> leads)
    {
        List<Group> queues = [SELECT Name FROM Group WHERE Type = 'Queue']; 
        
        for(Integer i = 0; i < 199; i++)
        {
            List<Account> a = [SELECT Id FROM Account];
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Finish');
    }
}
