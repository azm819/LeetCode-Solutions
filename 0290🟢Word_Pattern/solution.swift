class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.split(separator: " ").map(String.init)
        let chars = Array(pattern)
        guard words.count == chars.count else { return false }
        var dict = [Character: String]()
        var visited = Set<String>()
        for i in 0 ..< chars.count {
            if let word = dict[chars[i]] {
                if word != words[i] { return false }
            } else {
                if !visited.insert(words[i]).inserted {
                    return false
                }
                dict[chars[i]] = words[i]
            }
        }
        return true
    }
}
