class NumArray {
    private let sums: [Int]

    init(_ nums: [Int]) {
        var sum = 0
        sums = [0] + nums.map {
            sum += $0
            return sum
        }
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        sums[right + 1] - sums[left]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
