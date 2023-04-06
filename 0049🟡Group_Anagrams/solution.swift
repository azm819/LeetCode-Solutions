class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let sortedStrs = strs.map { str in
            Array(str).sorted()
        }
        var added = Array(repeating: false, count: strs.count)
        var result = [[String]]()
        for i in 0..<strs.count where !added[i] {
            added[i] = true
            var subRes = [strs[i]]
            if i < strs.count - 1 {
                for j in i+1..<strs.count where !added[j] && sortedStrs[i] == sortedStrs[j] {
                    added[j] = true
                    subRes.append(strs[j])
                }
            }
            result.append(subRes)
        }
        return result
    }
}
