trigger EmailSender on Candidate__c (before insert) {
    private String toAddress = '123@gmail.com';
    private String ccAddress = '1234@gmail.com';
    private String subject = 'Guide send mail';
    private String body = 'Hello all, Guide send mail';
    
    IF(toAddress != null || toAddress != ''){
        SendEmail.sendMail(toAddress, ccAddress, subject, body);
    } ELSE {
        System.debug('The following errors occurred');
    }
}