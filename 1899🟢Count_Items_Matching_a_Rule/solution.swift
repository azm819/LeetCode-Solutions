class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        switch ruleKey {
        case "type":
            return items.count { $0[0] == ruleValue }
        case "color":
            return items.count { $0[1] == ruleValue }
        case "name":
            return items.count { $0[2] == ruleValue }
        default:
            fatalError()
        }
    }
}

private extension Array {
    func count(_ match: (Element) -> Bool) -> Int {
        var result = 0
        for element in self where match(element) {
            result += 1
        }
        return result
    }
}

