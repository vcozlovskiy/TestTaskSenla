@isTest
public class TestAppointLeadToQueue {
    @testSetup
    static void setup() 
    {
        TestDataFactory.createLeadsWithScore(50);
    }
    @isTest static void test()
    {
        Test.startTest();

        AppointLeadToQueueBatch batch = new AppointLeadToQueueBatch();
        Database.executeBatch(batch);

        Test.stopTest();

        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        List<SObject> num = [SELECT Id,	Total_Score__c, OwnerId 
         FROM Lead
         WHERE Status = 'Open - Negotiations' AND Total_Score__c > 3 AND OwnerId  
         IN (SELECT Id FROM User WHERE ProfileId =: adminProfile.Id)
        ORDER BY	Total_Score__c DESC];

        System.assertEquals(0, num.size());
    }
}
