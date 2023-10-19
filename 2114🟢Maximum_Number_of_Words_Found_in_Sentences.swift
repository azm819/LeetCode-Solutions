class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        sentences.reduce(1) { partialResult, sentence in
            max(partialResult, sentence.split(separator: " ").count)
        }
    }
}

