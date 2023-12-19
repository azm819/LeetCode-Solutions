class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        var smoothedData = Array(repeating: Array(repeating: (0, 0), count: img[0].count), count: img.count)
        for i in 0 ..< img.count {
            for j in 0 ..< img[0].count {
                if let (val, count) = smoothedData[safe: i - 1]?[safe: j - 1] {
                    smoothedData[i - 1][j - 1] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i - 1]?[safe: j] {
                    smoothedData[i - 1][j] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i - 1]?[safe: j + 1] {
                    smoothedData[i - 1][j + 1] = (val + img[i][j], count + 1)
                }

                if let (val, count) = smoothedData[safe: i]?[safe: j - 1] {
                    smoothedData[i][j - 1] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i]?[safe: j] {
                    smoothedData[i][j] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i]?[safe: j + 1] {
                    smoothedData[i][j + 1] = (val + img[i][j], count + 1)
                }

                if let (val, count) = smoothedData[safe: i + 1]?[safe: j - 1] {
                    smoothedData[i + 1][j - 1] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i + 1]?[safe: j] {
                    smoothedData[i + 1][j] = (val + img[i][j], count + 1)
                }
                if let (val, count) = smoothedData[safe: i + 1]?[safe: j + 1] {
                    smoothedData[i + 1][j + 1] = (val + img[i][j], count + 1)
                }
            }
        }

        return smoothedData.map { row in row.map { $0.0 / $0.1 } }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

