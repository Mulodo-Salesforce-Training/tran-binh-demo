trigger EmailSender on Candidate__c (before insert) {
    private String toAddress = 'bvt1991@gmail.com';
    private String ccAddress = 'binhtv.it@gmail.com';
    private String subject = 'Guide send mail';
    private String body = 'Hello all, Guide send mail';

    IF(toAddress != null || toAddress != ''){
        SendEmail.sendMail(toAddress, ccAddress, subject, body);
    } ELSE {
        System.debug('The following errors occurred');
    }
}