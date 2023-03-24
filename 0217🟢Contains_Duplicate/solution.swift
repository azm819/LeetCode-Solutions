class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            let (inserted, _) = set.insert(num)
            if !inserted { return true }
        }
        return false
    }
}
