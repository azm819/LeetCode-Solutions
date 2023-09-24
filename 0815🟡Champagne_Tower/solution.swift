class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        guard query_row > .zero else {
            return poured > .zero ? 1 : 0
        }
        var glasses = [[Double]]()
        glasses.append([Double(poured)])
        for i in 1 ... query_row {
            glasses.append(Array(repeating: .zero, count: i + 1))
            for j in 0 ... i {
                if j != i && glasses[i - 1][j] > 1 {
                    glasses[i][j] += (glasses[i - 1][j] - 1) / 2
                }
                if j > .zero && glasses[i - 1][j - 1] > 1 {
                    glasses[i][j] += (glasses[i - 1][j - 1] - 1) / 2
                }
            }
        }
        return max(.zero, min(glasses[query_row][query_glass], 1))
    }
}
