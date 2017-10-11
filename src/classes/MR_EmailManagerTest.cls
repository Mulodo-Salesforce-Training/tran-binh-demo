@isTest
private class MR_EmailManagerTest {
     static List<Candidate__c> candidate{get;set;}
     @isTest static void MR_EmailManagerTest(){
	candidate = new List<Candidate__c>();
        candidate.add(new Candidate__c(
        First_Name__c = 'Tran',
        Last_Name__c = 'Binh',
        Email__c = 'tran.binh@mulodo.com',
        Phone__c = '01656256452',
        Years_of_Experience__c = 3));
    MR_EmailManager.sendConfirmEmails(candidate);
        
	}
}