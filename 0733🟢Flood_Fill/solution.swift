class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        guard image[sr][sc] != color else { return image }
        var queue = [(sr, sc)]
        let n = image.count
        let m = image[0].count
        var result = image
        while !queue.isEmpty {
            let (x, y) = queue.popLast()!
            let val = result[x][y]
            if val == color { continue }
            if x > 0 {
                if result[x - 1][y] == val {
                    queue.append((x - 1, y))
                }
            }
            if x < n - 1 {
                if result[x + 1][y] == val {
                    queue.append((x + 1, y))
                }
            }
            if y > 0 {
                if result[x][y - 1] == val {
                    queue.append((x, y - 1))
                }
            }
            if y < m - 1 {
                if result[x][y + 1] == val {
                    queue.append((x, y + 1))
                }
            }
            result[x][y] = color
        }
        return result
    }
}
