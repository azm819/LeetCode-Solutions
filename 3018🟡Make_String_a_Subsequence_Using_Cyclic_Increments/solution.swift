class Solution {
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        var ind1 = str1.startIndex
        var ind2 = str2.startIndex
        while ind1 != str1.endIndex {
            if str1[ind1] == str2[ind2] || str1[ind1] == "z" && str2[ind2] == "a" || str2[ind2].asciiValue! == str1[ind1].asciiValue! + 1 {
                ind2 = str2.index(after: ind2)
                if ind2 == str2.endIndex {
                    return true
                }
            }

            ind1 = str1.index(after: ind1)
        }

        return false
    }
}

