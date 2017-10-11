function getRemoteAccount () {
    var firstName         = document.getElementById('firstName').value;
    var lastName          = document.getElementById('lastName').value;
    var birthday          = document.getElementById('birthday').value;
    var phone             = document.getElementById('phone').value;
    var email             = document.getElementById('email').value;
    var street            = document.getElementById('street').value;
    var city              = document.getElementById('city').value;
    var stateProvince     = document.getElementById('stateProvince').value;
    var zipPostalCode     = document.getElementById('zipPostalCode').value;
    var country           = document.getElementById('country').value;
    var currentCompany    = document.getElementById('currentCompany').value;
    var currentlyEmployed = document.getElementById('currentlyEmployed').value;
    var yearsOfExperience = document.getElementById('yearsOfExperience').value;
    var education         = document.getElementById('education').value;

    Visualforce.remoting.Manager.invokeAction (
        'MR_CandidateRegister.toRegister',
            firstName, 
            lastName, 
            birthday, 
            phone, 
            email, 
            street, 
            city, 
            stateProvince, 
            zipPostalCode, 
            country, 
            currentCompany, 
            currentlyEmployed, 
            yearsOfExperience, 
            education,
        function ( result, event ) {
            if ( event.status ) {
                if ( event.result == firstName ) {
                    document.getElementById( "responseResult" ).innerHTML = "Create success Candidates with firstName: " + firstName;
                } else {
                    document.getElementById( "responseResult" ).innerHTML = event.result + "<br/>";
                }
            }
        }, {
            escape: true
        }
    );
}
