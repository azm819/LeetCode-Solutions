class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var lastChar: Character?
        var count = 0
        var result: Int?
        for char in num {
            if lastChar == char {
                count += 1
                if count == 3 {
                    if let res = result {
                        result = max(res, char.wholeNumberValue!)
                    } else {
                        result = char.wholeNumberValue
                    }
                }
            } else {
                lastChar = char
                count = 1
            }
        }

        if let result = result {
            return "\(result)\(result)\(result)"
        } else {
            return ""
        }
    }
}
