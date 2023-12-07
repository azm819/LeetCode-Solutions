class Solution {
    func largestOddNumber(_ num: String) -> String {
        guard let lastOdd = num.lastIndex(where: \.isOdd) else {
            return ""
        }
        return String(num.prefix(through: lastOdd))
    }
}

private extension Character {
    var isOdd: Bool {
        switch self {
        case "1", "3", "5", "7", "9": return true
        default: return false
        }
    }
}

