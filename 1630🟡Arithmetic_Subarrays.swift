class Solution {
    private func checkArithmeticSubarray(_ nums: [Int], _ l: Int, _ r: Int) -> Bool {
        var subarray = nums[l...r].sorted()
        let diff = subarray[1] - subarray[0]
        for i in 1..<subarray.count {
            if diff != subarray[i] - subarray[i - 1] {
                return false
            }
        }
        return true
    }

    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        zip(l, r).map { (l, r) in
            checkArithmeticSubarray(nums, l, r)
        }
    }
}
