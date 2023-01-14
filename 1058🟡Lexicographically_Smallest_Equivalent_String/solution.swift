class Solution {
    private var equalities: [Character: Set<Character>] = [
        "a": ["a"],
        "b": ["b"],
        "c": ["c"],
        "d": ["d"],
        "e": ["e"],
        "f": ["f"],
        "g": ["g"],
        "h": ["h"],
        "i": ["i"],
        "j": ["j"],
        "k": ["k"],
        "l": ["l"],
        "m": ["m"],
        "n": ["n"],
        "o": ["o"],
        "p": ["p"],
        "q": ["q"],
        "r": ["r"],
        "s": ["s"],
        "t": ["t"],
        "u": ["u"],
        "v": ["v"],
        "w": ["w"],
        "x": ["x"],
        "y": ["y"],
        "z": ["z"]
    ]

    private let letters: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var ind = s1.startIndex
        while ind < s1.endIndex {
            equalities[s1[ind]]?.insert(s2[ind])
            equalities[s2[ind]]?.insert(s1[ind])
            ind = s1.index(after: ind)
        }
        for i in 0...24 {
            for j in i+1...25 {
                let li = letters[i]
                let lj = letters[j]
                if !equalities[li]!.isDisjoint(with: equalities[lj]!) {
                    let ss = equalities[li]!.union(equalities[lj]!)
                    equalities[li] = ss
                    equalities[lj] = ss
                }
            }
        }
        var map = [Character: Character]()
        for i in equalities {
            map[i.key] = i.value.min()!
        }
        return String(baseStr.map { map[$0]! })
    }
}
