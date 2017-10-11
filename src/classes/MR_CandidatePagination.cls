public with sharing class MR_CandidatePagination {
     // the size of list per page
    private final Integer LIST_SIZE_PAGE = 5;
    private Integer count;
    private Integer totalSize;
    public String action { get; set; }
    
    public string FileId { get; set; }
    public String getFileId;
    public boolean con { get; set; }
    public String textName { get;set; }
    public ID folderid { get;set; }
    public Blob file { get;set; }
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
    
    //result when click button First, Previous, Next, End
     public PageReference selectAction () {
         
         //get paramater from apex with action click
         String action = Apexpages.currentPage().getParameters().get('paramValue');
         
        if(action == 'First') {
           count = 0;
        }
         
        if(action == 'Previous') {
           count -= customListSize;
        }
         
        if(action == 'Next') {
           count += customListSize;
        }
         
        if(action == 'End') {
            Integer mod = math.mod( totalSize, customListSize );
        	count = mod != 0 ? totalSize - mod : totalSize - customListSize;
        }
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
    
    public PageReference insrt()
        {
        Document d = new Document();
        d.name     = textName;
        d.body     = file; // body field in document object which holds the file.
        d.folderid = 'image'; //folderid where the document will be stored insert d;
        system.debug(d);
        insert d;
        con        = true;
        
        List<Document> attachedFiles = [select d.Id,d.body,d.Name from Document d order by Id Desc limit 1];
        if( attachedFiles != null && attachedFiles.size() > 0 ) {
        	fileId = attachedFiles[0].Id;
        }
        return null;    
    }
}