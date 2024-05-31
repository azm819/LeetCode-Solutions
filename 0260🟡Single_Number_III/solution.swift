class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let numsXor = nums.reduce(0, ^)
        let firstDiffBit = numsXor & -numsXor
        let a = nums.lazy.filter { $0 & firstDiffBit == firstDiffBit }.reduce(0, ^)
        return [a, numsXor ^ a]
    }
}

