class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var result = [String]()
        let words = words.map { Array($0) }
        let set = Set(words)
        for word in words {
            var dp = Array(repeating: false, count: word.count + 1)
            dp[0] = true
            for i in 1...word.count {
                var j = i == word.count ? 1 : 0
                while !dp[i] && j < i {
                    dp[i] = dp[j] && set.contains(Array(word[j..<i]))
                    j += 1
                }
            }
            if dp.last! {
                result.append(String(word))
            }
        }
        return result
    }
}
