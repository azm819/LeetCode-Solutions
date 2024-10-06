class Solution {
    private func checkSimilarity(_ words1: [String.SubSequence], _ words2: [String.SubSequence]) -> Bool {
        var ind1 = words1.startIndex
        var ind2 = words2.startIndex
        while ind1 < words1.endIndex && ind2 < words2.endIndex && words1[ind1] == words2[ind2] {
            ind1 = words1.index(after: ind1)
            ind2 = words1.index(after: ind2)
        }

        ind2 = words2.count - (words1.count - ind1)
        while ind2 < words2.endIndex {
            if words1[ind1] != words2[ind2] {
                return false
            }
            ind1 = words1.index(after: ind1)
            ind2 = words1.index(after: ind2)
        }

        return true
    }

    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        let words1 = sentence1.split(separator: " ")
        let words2 = sentence2.split(separator: " ")

        if words1.count == words2.count {
            return words1 == words2
        } else if words1.count < words2.count {
            return checkSimilarity(words1, words2)
        } else {
            return checkSimilarity(words2, words1)
        }
    }
}

