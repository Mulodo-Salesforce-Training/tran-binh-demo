public with sharing class MR_CandidatePagination {
     // the size of list per page
    private final Integer LIST_SIZE_PAGE = 5;
    private Integer count;
    private Integer totalSize;
    // custom size of list per page will be changed be user
    public Integer customListSize { get; set; }
    public List< Candidate__c > candidates {
        get {
            //Correct count after change size of list
            if ( math.mod( count, customListSize ) != 0 ) {
                count -= math.mod( count, customListSize );
            }
            return [SELECT Name, First_Name__c, Last_Name__c, City__c, State_Province__c, Phone__c
                    FROM Candidate__c
                    LIMIT: customListSize
                    OFFSET: count];
        }
    }

    // Set the total size in the constructor
    public MR_CandidatePagination () {
        totalSize           = [SELECT count() FROM Candidate__c];
        count               = 0;
        customListSize      = LIST_SIZE_PAGE;
    }
    
    // User clicked to first
    public PageReference toFirst () {
        count = 0;
        return null;
    }

    // User clicked previous button
    public PageReference toPrevious () {
        count -= customListSize;
        return null;
    }

    // User clicked next button
    public PageReference toNext () {
        count += customListSize;
        return null;
    }

    //Add condition to check if last page list is less than custom size list
    public PageReference toEnd () {
        Integer mod = math.mod( totalSize, customListSize );
        count = mod != 0 ? totalSize - mod : totalSize - customListSize;
        return null;
    }

    // This will disable the previous and first buttons
    public Boolean getDisablePrevious () {
        return count > 0 ? false : true;
    }

    // This will disable the next and end buttons
    public Boolean getDisableNext () {
        if ( count + customListSize < totalSize ) {
            return false;
        }
            return true;
    }

    // This will get current page
    public Integer getCurrentPage () {
        return count / customListSize + 1;
    }

    // This will get current page
    public Integer getTotalPage () {
        return totalSize / customListSize + 1;
    }
    //This will get total record
    public Integer getTotalRecord () {
        return totalSize;
    }
}