public with sharing class CandidateRegister {
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
                                      //String  country,
                                      String  currentCompany,
                                      Boolean currentlyEmployed//,
                                      //Integer yearsOfExperience,
                                      //String education
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
        //candidate.Country__c                 = country;
        candidate.Current_Employer__c        = currentCompany;
        candidate.Currently_Employed__c      = currentlyEmployed;
        //if(!String.isBlank(String.valueOf(yearsOfExperience))) {
        	//candidate.Years_of_Experience__c = yearsOfExperience;
        //}    
        //candidate.Education__c        = education;

        try {
            insert candidate;
        } catch ( DmlException ex ) {
            return ex.getMessage();
        }

        return firstName;
    }
    
    public String seCountry { get; set; }
    public List<SelectOption> getCountry(){
        List<SelectOption> options = new List<SelectOption>();
    	options.add(new SelectOption('None','--None--'));
        for(Candidate__c candidate : [SELECT country__c FROM Candidate__c WHERE Candidate__c.country__c =: seCountry])
        {
            options.add(new SelectOption('Country__c','Country__c'));
        }
        return options;
    }
    
    public List<SelectOption> educationLst {get;set;}
    public String selectedEducation{get;set;}
    public String selectedValues {get;set;}
    public CandidateRegister(){
      educationLst = new List<SelectOption>();
        
      educationLst.add(new SelectOption('','--None--'));
      educationLst.add(new SelectOption('HS Diploma','HS Diploma'));
      educationLst.add(new SelectOption('BA/BS','BA/BS'));
      educationLst.add(new SelectOption('MA/MS/MBA','MA/MS/MBA'));
      educationLst.add(new SelectOption('Ph.D.','Ph.D.'));
      educationLst.add(new SelectOption('Post Doc','Post Doc'));   
 	}
}