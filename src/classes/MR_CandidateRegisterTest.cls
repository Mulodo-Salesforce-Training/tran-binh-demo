@isTest
private class MR_CandidateRegisterTest {
    @isTest static void testCandidateRegister01() {
        String  firstName          = 'Tran Hung';
        String  lastName           = 'Binh';
        String  email              = 'tran.binh@mulodo.com';
        String  phone              = '0123456789';
        String  birthday      	   = '1989-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        Id id                      = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
        Candidate__c listCandidate = [SELECT First_Name__c, Last_Name__c, Birthday__c, Phone__c, Email__c, Street__c, City__c, State_Province__c,
                                            Zip_Postal_Code__c, Country__c, Current_Employer__c, Currently_Employed__c, Years_of_Experience__c, Education__c
                                            FROM Candidate__c WHERE Candidate__c.Id =: id];
        System.assertEquals('Tran Hung', listCandidate.First_Name__c);
        System.assertEquals('Binh', listCandidate.Last_Name__c);
        System.assertEquals(Date.parse('01/01/1989'), listCandidate.Birthday__c);
        System.assertEquals('0123456789', listCandidate.Phone__c);
        System.assertEquals('tran.binh@mulodo.com', listCandidate.Email__c);
        System.assertEquals('Ly Chinh Thang', listCandidate.Street__c);
        System.assertEquals('HCM', listCandidate.City__c);
        System.assertEquals('3', listCandidate.State_Province__c);
        System.assertEquals('13', listCandidate.Zip_Postal_Code__c);
        System.assertEquals('Albania', listCandidate.Country__c);
        System.assertEquals('Mulodo', listCandidate.Current_Employer__c);
        System.assertEquals(true, listCandidate.Currently_Employed__c);
        System.assertEquals(3, listCandidate.Years_of_Experience__c);
        System.assertEquals('HS Diploma', listCandidate.Education__c);
    }
    
     @isTest static void testCandidateRegister02() {
        String  firstName          = 'Tran Hung';
        String  lastName           = 'Binh';
        String  email              = 'tran.binh@gmail.com';
        String  phone              = '0123456789';
        String  birthday      	   = '1989-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        String result              = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
        System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Invalid email format: []', result);
    }
    
    @isTest static void testCandidateRegister03() {
        String  firstName          = 'Tran Hung';
        String  lastName           = 'Binh';
        String  email              = 'tran.binh@mulodo.com';
        String  phone              = '01234';
        String  birthday      	   = '1989-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        String result              = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
        System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Incorrect phone number format: []', result);
    }
    
    @isTest static void testCandidateRegister04() {
        String  firstName          = '';
        String  lastName           = 'Binh';
        String  email              = 'tran.binh@mulodo.com';
        String  phone              = '01234564789';
        String  birthday      	   = '1989-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        String result              = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
          System.assertEquals('Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [First_Name__c]: [First_Name__c]', result);
    }

    @isTest static void testCandidateRegister05() {
        String  firstName          = 'Tran';
        String  lastName           = '';
        String  email              = 'tran.binh@mulodo.com';
        String  phone              = '01234564789';
        String  birthday      	   = '1989-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        String result              = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
        System.assertEquals('Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Last_Name__c]: [Last_Name__c]', result);
    }  
    
      @isTest static void testCandidateRegister06() {
        String  firstName          = 'Tran';
        String  lastName           = 'Binh';
        String  email              = 'tran.binh@mulodo.com';
        String  phone              = '01234564789';
        String  birthday      	   = '2017-01-01 00:00:00';
        String  street             = 'Ly Chinh Thang';
        String  city               = 'HCM';
        String  stateProvince      = '3';
        String  zipPostalCode      = '13';
        String  country            = 'Albania';
        String  currentCompany     = 'Mulodo';
        Integer yearsOfExperience  = 3;
        Boolean currentlyEmployed  = true;
        String  education          = 'HS Diploma';
        // Implement test code
        String result              = MR_CandidateRegister.toRegister(firstName, lastName, birthday, phone, email, street, city, stateProvince, zipPostalCode,
                                                              country, currentCompany, currentlyEmployed, yearsOfExperience, education);
        System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Birthday less than 16 years old: []', result);
    }  
    
    @isTest static void testGetEducationPickList() {
		Test.startTest();
		String educationPickList = MR_CandidateRegister.getEducationPickList();
		Test.stopTest();
		System.assert(educationPickList != null, 'Should be able to get Education Pick List');
	}
    
    @isTest static void testGetCountryPickList() {
        Test.startTest();
        String countryPickList = MR_CandidateRegister.getCountryPickList();
        Test.stopTest();
        System.debug(countryPickList);
        System.assert(countryPickList != null, 'Should be able to get Country Pick List');
	}
}