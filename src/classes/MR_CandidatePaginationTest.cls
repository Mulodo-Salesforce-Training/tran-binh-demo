@isTest
public class MR_CandidatePaginationTest {
 	@isTest static void testListCandidate1 () {
        // Implement test code
        MR_CandidatePagination cp = new MR_CandidatePagination();
        System.assertEquals( null, cp.selectAction() );
        System.assertEquals( true, cp.getDisablePrevious() );
        System.assertEquals( true, cp.getDisableNext() );
        System.assertEquals( 1, cp.getCurrentPage() );
        System.assertEquals( 1, cp.getTotalPage() );
        System.assertEquals( 0, cp.getTotalRecord() );
    }
    
 	@isTest static void testListCandidate2 () {
        // Implement test code
        MR_CandidatePagination cp = new MR_CandidatePagination();
        System.assertEquals( null, cp.selectAction() );
        System.assertEquals( true, cp.getDisablePrevious() );
        System.assertEquals( true, cp.getDisableNext() );
        System.assertEquals( 1, cp.getCurrentPage() );
        System.assertEquals( 1, cp.getTotalPage() );
        System.assertEquals( 0, cp.getTotalRecord() );
    }
}