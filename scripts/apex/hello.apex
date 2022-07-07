// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
List<Case_Solution__c> s = [select Solution_Results__c, Solution_Type__c from Case_Solution__c LIMIT 1];

System.debug(s[0].Solution_Results__c);
System.debug(s[0].Solution_Type__c);

s[0].Solution_Type__c = 'Call';
s[0].Solution_Results__c = 'Cancelled';

System.debug(s[0].Solution_Results__c);
System.debug(s[0].Solution_Type__c);

System.debug(s.size());

update s;