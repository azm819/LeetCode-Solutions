class Solution {
    private static func convert(_ char: Character) -> Int {
        switch char {
        case "a": return 0
        case "b": return 1
        case "c": return 2
        case "d": return 3
        case "e": return 4
        case "f": return 5
        case "g": return 6
        case "h": return 7
        case "i": return 8
        case "j": return 9
        case "k": return 10
        case "l": return 11
        case "m": return 12
        case "n": return 13
        case "o": return 14
        case "p": return 15
        case "q": return 16
        case "r": return 17
        case "s": return 18
        case "t": return 19
        case "u": return 20
        case "v": return 21
        case "w": return 22
        case "x": return 23
        case "y": return 24
        case "z": return 25
        default: fatalError()
        }
    }

    private static func calcVariance(_ arr: [Int]) -> Int {
        var minEl: Int = .max
        var maxEl: Int = .min
        for elem in arr where elem != .zero {
            minEl = min(minEl, elem)
            maxEl = max(maxEl, elem)
        }
        return maxEl - minEl
    }

    func largestVariance(_ s: String) -> Int {
        var indSet = Set<Int>()
        var indeces = [Int]()
        var lastCharIndeces = Array(repeating: 0, count: 26)
        var charInd = 0
        for ch in s {
            let ind = Solution.convert(ch)
            indeces.append(ind)
            indSet.insert(ind)
            lastCharIndeces[ind] = charInd
            charInd += 1
        }
        guard indSet.count > 1 else { return .zero }
        var result = 0
        for majorInd in indSet {
            var state = Array(repeating: (0, 0), count: 26)
            for i in 0..<indeces.count {
                if indeces[i] == majorInd {
                    for j in 0..<state.count {
                        state[j].1 += 1
                        if state[j].0 != .zero {
                            result = max(result, state[j].1 - state[j].0)
                        }
                    }
                } else {
                    state[indeces[i]].0 += 1
                    if state[indeces[i]].1 - state[indeces[i]].0 < .zero && i != lastCharIndeces[indeces[i]] {
                        state[indeces[i]].0 = .zero
                        state[indeces[i]].1 = .zero
                    }
                    if state[indeces[i]].0 != .zero {
                        result = max(result, state[indeces[i]].1 - state[indeces[i]].0)
                    }
                }
            }
        }
        return result
    }
}
