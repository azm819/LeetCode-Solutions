class Solution {
    func removeAlmostEqualCharacters(_ word: String) -> Int {
        var ind = word.startIndex
        var result = 0
        var prev: Character?
        while ind < word.endIndex {
            if let prevCh = prev, abs(Int(prevCh.asciiValue!) - Int(word[ind].asciiValue!)) <= 1 {
                result += 1
                prev = nil
            } else {
                prev = word[ind]
            }
            ind = word.index(after: ind)
        }
        return result
    }
}

