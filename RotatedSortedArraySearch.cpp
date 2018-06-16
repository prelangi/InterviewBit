/*
Suppose a sorted array is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7  might become 4 5 6 7 0 1 2 ).

You are given a target value to search. If found in the array, return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Input : [4 5 6 7 0 1 2] and target = 4
Output : 0

NOTE : Think about the case when there are duplicates. Does your current solution work? How does the time complexity change?*
*/

// NOTE: InterviewBit does not support this question in Swift!! 

int Solution::search(const vector<int> &A, int B) {
    // Do not write main() function.
    // Do not read input, instead use the arguments to the function.
    // Do not print the output, instead return values as specified
    // Still have a doubt. Checkout www.interviewbit.com/pages/sample_codes/ for more details

    
    int start = 0;
    int end = A.size();
    int mid = start + (end-start)/2;
    
    while(start<=end) {
        mid = start + (end-start)/2;
        
        if(A[mid]==B) {
            return mid;
        }
        else if(A[mid] > A[start]) {
            if(B >= A[start] && B < A[mid]) {
                end = mid - 1;
            }
            else {
                start = mid + 1;
            }
        }
        else {
            if(B > A[mid] && B <= A[end]) {
                start = mid + 1;
            }
            else {
                end = mid - 1;
            }
        }
    }
    
    return -1;
    
}

