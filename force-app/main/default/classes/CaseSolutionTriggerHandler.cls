public class CaseSolutionTriggerHandler implements TriggerHandler{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    private CaseSolutionTriggerHelper helper;

    public CaseSolutionTriggerHandler() 
    {
        this.helper = new CaseSolutionTriggerHelper();
    }

    public void beforeInsert(List<SObject> newRecords)
    {

    }

    public void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap)
    {

    }

    public void beforeDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap)
    {

    }

    public void afterInsert(List<SObject> newRecords, Map<ID, SObject> newRecordMap)
    {

    }

    public void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords)
    {
        System.debug('Inside trigger handler after update');

        if(oldRecords == null || newRecords == null)
        {
            System.debug('oldRecords or newRecords is null');
            return;
        }

        Case_Solution__c tempNewRecord, tempOldRecord;

        for(integer i = 0; i < newRecords.size(); i++)
        {
            tempNewRecord = (Case_Solution__c)newRecords[i];
            tempOldRecord = (Case_Solution__c)oldRecords[i];

            if(CheckSolutionResultValue(tempNewRecord, tempOldRecord))
            {
                helper.handleAfterUpdate(tempOldRecord, tempNewRecord);
            }

            System.debug('Old: ' + tempOldRecord.Solution_Results__c);
            System.debug('New: ' + tempNewRecord.Solution_Results__c);
        }
    }
   
    public void afterDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap)
    {

    }

    public void afterUndelete(List<SObject> newRecords, Map<ID, SObject> newRecordMap)
    {
        
    }
    
    private Boolean CheckSolutionResultValue(Case_Solution__c newRecord, Case_Solution__c oldRecord){
        return tempOldRecord.Solution_Results__c != tempNewRecord.Solution_Results__c
                && (tempNewRecord.Solution_Results__c == 'Resolved via call' || tempNewRecord.Solution_Results__c == 'Resolved in advance');
    }
}
