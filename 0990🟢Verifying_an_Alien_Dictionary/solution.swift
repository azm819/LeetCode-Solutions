class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else { return true }
        let alph = order.enumerated().reduce(into: [Character: Int]()) { partialResult, elem in
            partialResult[elem.element] = elem.offset
        }
        for i in 1..<words.count {
            let cur = words[i]
            let prev = words[i - 1]
            var ind = cur.startIndex
            var flag = false
            while ind < cur.endIndex && ind < prev.endIndex {
                if cur[ind] != prev[ind] {
                    if alph[cur[ind]]! < alph[prev[ind]]! {
                        return false
                    }
                    flag = true
                    break
                }
                ind = cur.index(after: ind)
            }
            if !flag && cur.count < prev.count {
                return false
            }
        }
        return true
    }
}
