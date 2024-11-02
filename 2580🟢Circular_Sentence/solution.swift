class Solution {
    func isCircularSentence(_ sentence: String) -> Bool {
        guard sentence.first == sentence.last else {
            return false
        }

        var prevCh: Character?
        for word in sentence.split(separator: " ") {
            if let prevCh, prevCh != word.first {
                return false
            }

            prevCh = word.last
        }

        return true
    }
}

