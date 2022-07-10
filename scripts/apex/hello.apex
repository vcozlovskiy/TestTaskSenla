// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
/*ist<Group> s = [select Name from Group where Type = 'Queue'];

for(Group g : s){
    System.debug(g);
}

List<Lead> leads = [SELECT Id FROM Lead WHERE Status = 'Open - Negotiations'];

for(Lead l : leads)
{
    System.debug(l);
} 
*/