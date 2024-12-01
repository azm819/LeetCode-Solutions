class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var numsSet = Set<Int>()
        for num in arr {
            if numsSet.contains(num * 2) || num % 2 == .zero && numsSet.contains(num / 2) {
                return true
            }
            numsSet.insert(num)
        }
        return false
    }
}

