public with sharing class CaseDublicateController {

    @AuraEnabled(cacheable=true)
    public static List<Case> getDublicate(String caseId) {
        Case caseOrigin = [SELECT Subject, SuppliedEmail, Reason
                           FROM Case
                           WHERE Id =: caseId];
        return [
            SELECT CaseNumber, Origin, ContactEmail, Status, Reason, OwnerId
            FROM Case
            WHERE ((Subject =: caseOrigin.Subject AND Subject != '')
                  OR (SuppliedEmail =: caseOrigin.SuppliedEmail AND SuppliedEmail != '')
                  OR (Reason =: caseOrigin.Reason AND Reason != '')) 
                  AND (Status !=: 'Closed')
                  AND (Id !=: caseId)
        ];
    }
}