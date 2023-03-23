class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var fromFirst = true
        var ind1 = word1.startIndex
        var ind2 = word2.startIndex
        var result = ""
        while ind1 != word1.endIndex && ind2 != word2.endIndex {
            if fromFirst {
                result.append(word1[ind1])
                ind1 = word1.index(after: ind1)
            } else {
                result.append(word2[ind2])
                ind2 = word2.index(after: ind2)
            }
            fromFirst.toggle()
        }
        while ind1 != word1.endIndex {
            result.append(word1[ind1])
            ind1 = word1.index(after: ind1)
        }
        while ind2 != word2.endIndex {
            result.append(word2[ind2])
            ind2 = word2.index(after: ind2)
        }
        return result
    }
}
