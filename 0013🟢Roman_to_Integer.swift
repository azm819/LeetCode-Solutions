class Solution {
    private let numerals: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    func romanToInt(_ s: String) -> Int {
        return s.compactMap { numerals[$0] }
            .reversed()
            .reduce((0, 0)) {$0.1 <= $1 ? ($0.0 + $1, $1) : ($0.0 - $1, 0) }
            .0
    }
}
