trigger DoublePosition on Position__c (before insert, before update ) {

    Integer count = 0;
    List< String > listPossionName = new List< String >();
            for ( Position__c pos : ( List< Position__c> ) Trigger.New ) {
            listPossionName.add( pos.Name );
        }
    List< Position__c > listPossion = [SELECT Id, Name FROM Position__c WHERE Name IN :listPossionName];
    
    if (trigger.isInsert) {
        for ( Position__c pos : listPossion ) {
            for ( Position__c posNew : ( List< Position__c> ) Trigger.New ) {
                
                // check create id postion
                if ( posNew.Id != pos.Id ) {
                    posNew.addError( 'Create Position name: ' + pos.Name + ' is already existed ! Error!' );
                }
            }
        }      
    } else if (trigger.isUpdate) {
      
        for ( Position__c pos : listPossion ) {
            for ( Position__c posNew : ( List< Position__c> ) Trigger.New ) {
                
                // Check update id postion
                if ( posNew.Name == pos.Name && posNew.Id != pos.Id ) {
                    posNew.addError( 'Position name: ' + pos.Name + ' is already existed ! Error!' );
                }
            }
        }
    }
}