class Solution {
    static let hashBase: UInt64 = 29
    static let modValue: UInt64 = 1_000_000_007

    func shortestPalindrome(_ s: String) -> String {
        var str = Array(s)
        var forwardHash: UInt64 = .zero
        var reverseHash: UInt64 = .zero
        var powerValue: UInt64 = 1
        var endIndex = -1
        for i in 0 ..< str.count {
            let currentValue = str[i].value

            forwardHash = (forwardHash * Solution.hashBase + currentValue) % Solution.modValue
            reverseHash = (reverseHash + currentValue * powerValue) % Solution.modValue
            powerValue = (powerValue * Solution.hashBase) % Solution.modValue

            if forwardHash == reverseHash {
                endIndex = i
            }
        }

        return String(str[(endIndex + 1)...].reversed() + str)
    }
}

private extension Character {
    static var cachedValues: [Character: UInt64] = [:]
    static let firstCharacterValue = Character("a").asciiValue!

    var value: UInt64 {
        if let value = Character.cachedValues[self] {
            return value
        }

        let value = UInt64(asciiValue! - Character.firstCharacterValue + 1)
        Character.cachedValues[self] = value
        return value
    }
}
