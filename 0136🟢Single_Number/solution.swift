class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        nums.reduce(.zero, ^)
    }
}
