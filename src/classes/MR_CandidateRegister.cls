public with sharing class MR_CandidateRegister {
    // procedure constructor
	public MR_CandidateRegister(ApexPages.StandardController controller) {

	}
    
   @RemoteAction
    public static String toRegister ( String  firstName,
                                      String  lastName,
                                      String  birthday,
                                      String  phone,
                                      String  email,
                                      String  street,
                                      String  city,
                                      String  stateProvince,
                                      String  zipPostalCode,
                                      String  country,
                                      String  currentCompany,
                                      Boolean currentlyEmployed,
                                      Integer yearsOfExperience,
                                      String  education
                                    ) {
                                          
        Candidate__c candidate               = new Candidate__c();
        candidate.First_Name__c              = firstName;
        candidate.Last_Name__c               = lastName;
        //check and initialization date
        if( !String.isBlank(birthday) ) {
            Date newDate                     = Date.valueOf(birthday);
            candidate.Birthday__c            = newDate;
        }
        candidate.Phone__c                   = phone;
        candidate.Email__c                   = email;
        candidate.Street__c                  = street;
        candidate.City__c                    = city;
        candidate.State_Province__c          = stateProvince;
        candidate.Zip_Postal_Code__c         = zipPostalCode;
        candidate.Country__c                 = country;
        candidate.Current_Employer__c        = currentCompany;
        candidate.Currently_Employed__c      = currentlyEmployed;
        if(yearsOfExperience == null) {
            candidate.Years_of_Experience__c = 0;
        } else {
            candidate.Years_of_Experience__c = yearsOfExperience;
        }
        
        candidate.Education__c               = education;

        try {
            insert candidate;
        } catch ( DmlException ex ) {
            return ex.getMessage();
        }

        return candidate.Id;
    }

    @RemoteAction
	public static String getJSONCandidates() {
		// serialize to JSON
		return JSON.serialize([SELECT First_Name__c, Last_Name__c FROM Candidate__c]);
	}

    @RemoteAction
	public static String getCountryPickList() {
		Schema.DescribeFieldResult fieldCountry = Candidate__c.Country__c.getDescribe();
		List<Schema.PicklistEntry> pickListCountry = fieldCountry.getPicklistValues();
		return JSON.serialize(pickListCountry);
    }
    
    @RemoteAction
	public static String getEducationPickList() {
		Schema.DescribeFieldResult fieldEducation = Candidate__c.Education__c.getDescribe();
		List<Schema.PicklistEntry> pickListEducation = fieldEducation.getPicklistValues();
		return JSON.serialize(pickListEducation);
	}
}