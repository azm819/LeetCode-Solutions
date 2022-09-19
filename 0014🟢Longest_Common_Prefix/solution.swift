class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        let firstStr = strs.first!
        var ind = firstStr.startIndex
        var currCh: Character
        if ind != firstStr.endIndex {
            currCh = firstStr[ind]
        } else {
            return result
        }
        while strs.allSatisfy({ ind != $0.endIndex && $0[ind] == currCh }) {
            ind = firstStr.index(after: ind)
            result.append(currCh)
            if ind != firstStr.endIndex {
                currCh = firstStr[ind]
            }
        }
        return result
    }
}
