public class EmailManager {

    public static void sendConfirmEmails(List<Candidate__c> lstCandidates) {
    	List<Messaging.SingleEmailMessage> listMail = new List<Messaging.SingleEmailMessage>();
    	EmailTemplate templateId = [SELECT Id FROM EmailTemplate WHERE Name = 'Candidate Confirm' LIMIT 1];
  
    	for (Candidate__c candidate: lstCandidates) {
    		Messaging.SingleEmailMessage mail =  Messaging.renderStoredEmailTemplate(templateId.Id, candidate.OwnerID, candidate.Id);
			String[] toAddresses = new String[] {candidate.Email__c};
	        mail.setToAddresses(toAddresses);
			mail.setSaveAsActivity(false);
	       	listMail.add(mail);
    	}
		Messaging.SendEmailResult [] result= Messaging.sendEmail(listMail);
		System.debug(result);
    }
}