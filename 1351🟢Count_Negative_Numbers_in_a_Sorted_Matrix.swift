class Solution {
    private func search(_ vec: [Int]) -> Int {
        guard vec.last! < .zero else { return .zero }
        var l = 0
        var r = vec.count - 1
        while l < r {
            let c = (l + r) / 2
            if vec[c] < .zero {
                r = c
            } else {
                l = c + 1
            }
        }
        return vec.count - l
    }

    func countNegatives(_ grid: [[Int]]) -> Int {
        grid
            .map(search)
            .reduce(0, +)
    }
}
