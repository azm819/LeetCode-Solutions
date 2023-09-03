class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var counts = [Character: Int]()
        for char in magazine {
            counts[char, default: .zero] += 1
        }
        for char in ransomNote {
            if let count = counts[char], count > .zero {
                counts[char] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}

