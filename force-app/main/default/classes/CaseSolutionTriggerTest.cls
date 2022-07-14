@isTest
public class CaseSolutionTriggerTest {
    @isTest static void CaseSolutionTriggerHandlerAfterUpdateTest(){
        Case caseTest = new Case();
        caseTest.Origin = 'Phone';
        caseTest.Status = 'New';
        List<Case_Solution__c> listCaseSol = new List<Case_Solution__c>();
        insert caseTest;

        for(Integer i = 0; i < 3; i++)
        {
            listCaseSol.add(new Case_Solution__c(Solution_Type__c='Call', Solution_Results__c='Need a check', Case__c=caseTest.Id));
        }

        caseTest.Case_Solutions__r.addAll(listCaseSol);
        insert listCaseSol;

        listCaseSol[0].Solution_Results__c = 'Resolved via call';

        Test.startTest();
        Database.update(listCaseSol);
        Test.stopTest();

        for(Case_Solution__c c : [SELECT Id, Solution_Results__c FROM Case_Solution__c WHERE Case__c =: caseTest.Id])
        {
            System.debug(c.Solution_Results__c);

            if(c.Solution_Results__c  != 'Cancelled')
            {
                if(c.Solution_Results__c != 'Resolved via call')
                {
                    System.assert((false), c.Solution_Results__c);
                }
            }
        }

        caseTest = [SELECT Id, Status FROM Case WHERE Id =: caseTest.Id];
        
        if(caseTest.Status == 'Resolved')
        {
            System.assert(true);
        }
        else 
        {
            System.assert(false);
        }
    }
}
