/*
N number of books are given. 
The ith book has Pi number of pages. 
You have to allocate books to M number of students so that maximum number of pages alloted to a student is minimum. A book will be allocated to exactly one student. Each student has to be allocated at least one book. Allotment should be in contiguous order, for example: A student cannot be allocated book 1 and book 3, skipping book 2.

NOTE: Return -1 if a valid assignment is not possible

Input:

List of Books
M number of students
Your function should return an integer corresponding to the minimum number.

Example:

P : [12, 34, 67, 90]
M : 2

Output : 113

There are 2 number of students. Books can be distributed in following fashion : 
  1) [12] and [34, 67, 90]
      Max number of pages is allocated to student 2 with 34 + 67 + 90 = 191 pages
  2) [12, 34] and [67, 90]
      Max number of pages is allocated to student 2 with 67 + 90 = 157 pages 
  3) [12, 34, 67] and [90]
      Max number of pages is allocated to student 1 with 12 + 34 + 67 = 113 pages

Of the 3 cases, Option 3 has the minimum pages = 113. 
*/

/*
This is an interesting application of binary search. Instead of iterating over the array with an heuristic value (avg value), we 
try to find the value that would work by looking for viable solutions. It took me a while to understand the concept. 

Use binary search to look for viable solutions that will do the allocation 
(An allocation is not viable if the number of students is greater than the given number of students)
Binary search between maxPages and sumOfPages as start and end values. 
*/


import Foundation

class Solution {

    func allocateBooks(_ A: [Int], _ B: Int, _ pagesPerBook: Int)-> Bool {
        var currPages = 0
        var numStudents = 1
        for i in 0..<A.count {
            currPages += A[i]
            if(currPages > pagesPerBook) {
                currPages = A[i]
                numStudents += 1
            }
        }
        return (numStudents>B) ? false: true
    }
    
    func books(_ A: inout [Int], _ B: inout Int) -> Int {
        var minPages = -1;
        var numStudents = B;
        
        if(numStudents > A.count) {
            return -1;
        }
        var sum = A.reduce(0,+)
        var maxPages = A.max()!
        
        var start = maxPages
        var end = sum
        var mid = start + (end-start)/2
        
        while(start<=end) {
            mid = start + (end-start)/2
            
            if(allocateBooks(A,B,mid)) {
                end = mid - 1
            }
            else {
                start = mid + 1
            }
        }
        return allocateBooks(A,B,start) ? start : -1
    }
}
