private extension String {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty && strs.allSatisfy(\.isNotEmpty) else { return "" }
        var ind = strs[0].startIndex
        var result = [Character]()
        while strs.allSatisfy({ ind < $0.endIndex }) && strs.allSatisfy({ $0[ind] == strs[0][ind] }) {
            result.append(strs[0][ind])
            ind = strs[0].index(after: ind)
        }
        return String(result)
    }
}
