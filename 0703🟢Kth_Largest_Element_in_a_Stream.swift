class KthLargest {
    private let kInd: Int
    private var nums: [Int]

    init(_ k: Int, _ nums: [Int]) {
        kInd = k - 1
        self.nums = nums
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort(by: >)
        return nums[kInd]
    }
}


/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
