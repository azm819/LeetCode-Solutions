class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let result = nums
            .map(String.init)
            .sorted { lhs, rhs in
                lhs + rhs > rhs + lhs
            }
            .joined()

        return result.first == "0" ? "0" : result
    }
}

