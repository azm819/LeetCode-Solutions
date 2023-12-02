class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        let chars: [Character: Int] = {
            var dict = [Character: Int]()
            for char in chars {
                dict[char, default: .zero] += 1
            }
            return dict
        }()
        return words
            .filter { word in
                var chars = chars
                return word.allSatisfy { char in
                    if let count = chars[char], count > .zero {
                        chars[char] = count - 1
                        return true
                    }
                    chars[char] = nil
                    return false
                }
            }
            .map(\.count)
            .reduce(0, +)
    }
}

