class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var prefixSums = [Int: Int]()
        var curSum = 0
        prefixSums[curSum] = 1
        var result = 0
        for num in nums {
            curSum += num % 2
            if let oppSums = prefixSums[curSum - k] {
                result += oppSums
            }
            prefixSums[curSum, default: .zero] += 1
        }

        return result
    }
}

