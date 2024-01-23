class Solution {
    func maxLength(_ arr: [String], _ ind: Int = .zero, _ set: Set<Character> = Set()) -> Int {
        guard ind < arr.count else { return .zero }
        var result = maxLength(arr, ind + 1, set)
        var newSet = set
        for ch in arr[ind] {
            if !newSet.insert(ch).inserted {
                return result
            }
        }
        return max(result, arr[ind].count + maxLength(arr, ind + 1, newSet))
    }
}

