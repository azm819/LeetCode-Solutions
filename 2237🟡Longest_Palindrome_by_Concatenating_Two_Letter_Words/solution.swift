class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var map = [[Character]: Int]()
        var result = 0
        for word in words {
            let wordArr = Array(word)
            let wordRev = Array(wordArr.reversed())
            if let cnt = map[wordRev] {
                result += 4
                map[wordRev] = cnt > 1 ? cnt - 1 : nil
            } else {
                map[wordArr] = map[wordArr, default: .zero] + 1
            }
        }
        for arr in map.keys {
            if arr[0] == arr[1] {
                result += 2
                break
            }
        }
        map.removeAll()
        return result
    }
}
