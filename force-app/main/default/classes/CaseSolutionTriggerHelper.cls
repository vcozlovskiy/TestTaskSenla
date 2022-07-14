public with sharing class CaseSolutionTriggerHelper {
    public void handleAfterUpdate(Case_Solution__c oldRecord, Case_Solution__c newRecord)
    {
        RefreshCaseParent(oldRecord);
    }

    public void RefreshCaseParent(Case_Solution__c child)
    {
        Case caseParent = [SELECT Id, (SELECT Solution_Results__c, Solution_Type__c FROM Case_Solutions__r WHERE Id !=: child.Id) 
                                            FROM Case 
                                            WHERE Id =: child.Case__c];

        for(Case_Solution__c s : caseParent.Case_Solutions__r)
        {
            s.Solution_Results__c = 'Cancelled';
        }

        caseParent.Status = 'Resolved';

        update caseParent;
        update caseParent.Case_Solutions__r;
    }
}
