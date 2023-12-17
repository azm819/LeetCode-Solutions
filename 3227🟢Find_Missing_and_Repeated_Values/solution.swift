class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var counts = Array(repeating: 0, count: grid.count * grid.count)
        var a = 0
        for row in grid {
            for num in row {
                counts[num - 1] += 1
                if counts[num - 1] == 2 {
                    a = num
                }
            }
        }
        return [a, counts.firstIndex(of: .zero)! + 1]
    }
}

