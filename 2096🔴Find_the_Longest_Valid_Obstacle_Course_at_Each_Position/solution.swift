class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: obstacles.count)
        var lis = [Int]()
        for i in 0..<obstacles.count {
            if (lis.last ?? .zero) <= obstacles[i] {
                lis.append(obstacles[i])
                result[i] = lis.count
            } else {
                var l = 0
                var r = lis.count - 1
                while l < r {
                    let c = (l + r) / 2
                    if lis[c] > obstacles[i] {
                        r = c
                    } else {
                        l = c + 1
                    }
                }
                lis[l] = obstacles[i]
                result[i] = l + 1
            }
        }
        return result
    }
}

