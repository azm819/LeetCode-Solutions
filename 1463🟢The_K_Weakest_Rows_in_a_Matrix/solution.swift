class Solution {
    private func search(_ vec: [Int]) -> Int {
        guard vec.first != .zero else { return .zero }
        var l = 0
        var r = vec.count - 1
        while l < r {
            let c = (l + r + 1) / 2
            if vec[c] == .zero {
                r = c - 1
            } else {
                l = c
            }
        }
        return l + 1
    }

    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        mat
            .map(search)
            .enumerated()
            .sorted { $0.element < $1.element }[0..<k]
            .map(\.offset)
    }
}
