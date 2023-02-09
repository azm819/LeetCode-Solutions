class Solution {
    func distinctNames(_ ideas: [String]) -> Int {
        var map = [Character: Set<String.SubSequence>]()
        for idea in ideas {
            let ch = idea.first!
            var set = map[ch, default: .init()]
            set.insert(idea.dropFirst())
            map[ch] = set
        }

        var result = 0
        let keys = Array(map.keys)
        for i in 0..<keys.count - 1 {
            for j in i+1..<keys.count {
                let first = map[keys[i]]!
                let second = map[keys[j]]!
                let com = first.intersection(second).count
                result += (first.count - com) * (second.count - com) * 2
            }
        }
        return result
    }
}
