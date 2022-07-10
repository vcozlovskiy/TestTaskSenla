@isTest
public class TestAppointLeadToQueue {
    @testSetup
    static void setup() 
    {
        TestDataFactory.createLeadsWithScore(200);
    }
    @isTest static void test()
    {
        Test.startTest();

        AppointLeadToQueueBatch batch = new AppointLeadToQueueBatch();
        Database.executeBatch(batch);

        Test.stopTest();

        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        List<SObject> num = [SELECT Id 
            FROM Lead 
            WHERE OwnerId IN (SELECT Id FROM User WHERE ProfileId =: adminProfile.Id) 
            AND Status = 'Open - Negotiations' 
            AND Total_Score__c > 3];

        System.assertEquals(num.size(), 0);
    }
}
