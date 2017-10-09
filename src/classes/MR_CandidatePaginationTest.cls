@isTest
public class MR_CandidatePaginationTest {
 @isTest static void testListCandidate () {
        // Implement test code
        MR_CandidatePagination cp = new MR_CandidatePagination();
        System.assertEquals( null, cp.toFirst() );
        System.assertEquals( null, cp.toEnd() );
        System.assertEquals( null, cp.toPrevious() );
        System.assertEquals( null, cp.toNext() );
        System.assertEquals( true, cp.getDisablePrevious() );
        System.assertEquals( true, cp.getDisableNext() );
        System.assertEquals( 0, cp.getCurrentPage() );
        System.assertEquals( 1, cp.getTotalPage() );
        System.assertEquals( 0, cp.getTotalRecord() );
    }
}