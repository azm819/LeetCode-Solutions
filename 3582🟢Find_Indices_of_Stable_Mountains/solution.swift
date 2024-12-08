class Solution {
    func stableMountains(_ height: [Int], _ threshold: Int) -> [Int] {
        var result = [Int]()
        var prevHeight: Int = .min
        for i in 0 ..< height.count {
            if prevHeight > threshold {
                result.append(i)
            }
            prevHeight = height[i]
        }

        return result
    }
}

