public class MR_EmailManager {
    public static void sendConfirmEmails(List<Candidate__c> lstCandidates) {
        List<Messaging.SingleEmailMessage> listMail = new List<Messaging.SingleEmailMessage>();
        //Select EmailTemplate send mail
        EmailTemplate templateId = [SELECT Id FROM EmailTemplate WHERE Name = 'Email' LIMIT 1];
        
        for (Candidate__c candidate: lstCandidates) {
            Messaging.SingleEmailMessage email =  Messaging.renderStoredEmailTemplate(templateId.Id, candidate.OwnerID, candidate.Id);
            String[] toAddresses = new String[] {candidate.Email__c};
            email.setToAddresses(toAddresses);
            email.setSaveAsActivity(false);
            listMail.add(email);
        }
        //Call method send email
        Messaging.sendEmail(listMail);
    }
}