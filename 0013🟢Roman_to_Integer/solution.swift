class Solution {
    func romanToInt(_ c: Character) -> Int {
        switch c {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }

    func romanToInt(_ s: String) -> Int {
        var result = 0
        var ind = s.startIndex
        var lastInt = romanToInt(s[ind])
        ind = s.index(after: ind)
        while ind != s.endIndex {
            let currInt = romanToInt(s[ind])
            if lastInt >= currInt {
                result += lastInt
                lastInt = currInt
                ind = s.index(after: ind)
            } else {
                result += currInt - lastInt
                ind = s.index(after: ind)
                lastInt = 0
                if ind == s.endIndex { break }
                lastInt = romanToInt(s[ind])
                ind = s.index(after: ind)
            }
        }
        result += lastInt
        return result
    }
}
