@isTest
public with sharing class CaseDublicateControllerTest {
    @isTest static void testControllerPositive(){
        System.assert(testController('Test subject', 'Test subject'));
    }
    @isTest static void testControllerNegative(){
        System.assert(!testController('Test subject', 'Subject test '));
    }

    static Boolean testController(String subject1, String subject2){
        Case testCase1 = new Case();
        testCase1.Subject = subject1;
        insert testCase1;
        
        Case testCase2 = new Case();
        testCase2.Subject = subject2;
        insert testCase2;

        List<Case> cases = CaseDublicateController.getDublicate(testCase1.Id);

        return cases.size() == 1 &&
               [SELECT Subject FROM Case WHERE Id =: cases[0].Id].Subject == testCase1.Subject;
    }
}
