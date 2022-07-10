@isTest
public class TestDataFactory {
    public static List<Lead> createLeadsWithScore(Integer numberOfLeads){

        List<Lead> leads = new List<Lead>();
        
        for(Integer i = 0; i < numberOfLeads; i++)
        {
            Lead tempLead = new Lead();
            tempLead.LastName = 'TestName';
            tempLead.Company = 'TestCompany';

            tempLead.Budget__c = getRandBuget();
            tempLead.Authority__c = getRandAuthority();
            tempLead.Need__c = getRandNeed();

            leads.add(tempLead);
        }

        insert leads;
        return leads;
    }

    public static String getRandBuget()
    {
        String buget;

        if(getRandBool())
        {
            buget = 'Budget Confirmed, Amount Unknown';
        }
        else
        {
            if(getRandBool())
            {
                buget = 'Budget Confirmed, Amount Known';
            }
            else
            {
                buget = 'Budget Not Confirmed';
            }
        }

        return buget;
    }

    public static String getRandAuthority()
    {
        String Authority;

        if(getRandBool())
        {
            Authority = 'Access to Buyer Confirmed';
        }
        else
        {
            if(getRandBool())
            {
                Authority = 'Access to Buyer Unconfirmed';
            }
            else
            {
                Authority = 'No Access to Buyer';
            }
        }

        return Authority;
    }

    public static String getRandNeed(){
        String Need;

        if(getRandBool())
        {
            Need = 'Urgent Need';
        }
        else
        {
            if(getRandBool())
            {
                Need = 'Intermediate Need';
            }
            else
            {
                Need = 'No Urgent Need';
            }
        }

        return Need;
    }

    public static Boolean getRandBool()
    {
        Integer randomNumber = Integer.valueof((math.random() * 10));
        return Math.mod(randomNumber,2) == 0 ? true : false;
    }
}
