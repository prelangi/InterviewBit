/*
There are N coins (Assume N is even) in a line. Two players take turns to take a coin from one of the ends of the line until there are no more coins left. The player with the larger amount of money wins. Assume that you go first.

Write a program which computes the maximum amount of money you can win.

Example:

suppose that there are 4 coins which have value
1 2 3 4
now you are first so you pick 4
then in next term
next person picks 3 then
you pick 2 and
then next person picks 1
so total of your money is 4 + 2 = 6
next/opposite person will get 1 + 3 = 4
so maximum amount of value you can get is 6
*/
import Foundation

class Solution {
    func maxcoin(_ A: inout [Int]) -> Int {
    
        //Handle Base cases
        if(A.count==0) {
            return 0
        }
        if(A.count==1) {
            return A[0]
        }
        if(A.count==2) {
            return max(A[0],A[1])
        }
        
        let len = A.count
        var dp = Array(repeating:Array(repeating:0,count:len),count:len)
        
        var a = 0, b = 0, c = 0
        
        for interval in 0..<len {
            for (i,j) in zip(0..<len,interval..<len) {
                
                a = j>=i+2 ? dp[i+2][j] : 0
                b = j-1>=i+1 ? dp[i+1][j-1] : 0
                c = j-2>=i ? dp[i][j-2] : 0
                
                dp[i][j] = max(A[i] + min(a,b), A[j] + min(b,c))
                
                
            }
        }
        
        return dp[0][len-1]
    }
}
