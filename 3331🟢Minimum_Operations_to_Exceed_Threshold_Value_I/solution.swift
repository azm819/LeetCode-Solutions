class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        nums.reduce(0) {
            if $1 < k {
                return $0 + 1
            } else {
                return $0
            }
        }
    }
}
