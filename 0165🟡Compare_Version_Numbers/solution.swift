class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var ind1 = version1.startIndex
        var ind2 = version2.startIndex
        while ind1 != version1.endIndex || ind2 != version2.endIndex {
            var ver1 = 0
            while ind1 != version1.endIndex, let value = version1[ind1].wholeNumberValue {
                ver1 = ver1 * 10 + value
                ind1 = version1.index(after: ind1)
            }
            if ind1 != version1.endIndex, version1[ind1] == "." {
                ind1 = version1.index(after: ind1)
            }

            var ver2 = 0
            while ind2 != version2.endIndex, let value = version2[ind2].wholeNumberValue {
                ver2 = ver2 * 10 + value
                ind2 = version2.index(after: ind2)
            }
            if ind2 != version2.endIndex, version2[ind2] == "." {
                ind2 = version2.index(after: ind2)
            }

            if ver1 < ver2 {
                return -1
            } else if ver1 > ver2 {
                return 1
            }
        }

        return 0
    }
}
