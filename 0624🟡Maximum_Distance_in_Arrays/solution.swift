class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var firstMin: Int = .max
        var firstMinInd: Int = -1
        var secondMin: Int = .max
        var secondMinInd: Int = -1

        var firstMax: Int = .min
        var firstMaxInd: Int = -1
        var secondMax: Int = .min
        var secondMaxInd: Int = -1

        for i in 0 ..< arrays.count {
            let array = arrays[i]
            let first = array.first!
            let last = array.last!

            if first < firstMin {
                secondMin = firstMin
                secondMinInd = firstMinInd
                firstMin = first
                firstMinInd = i
            } else if first < secondMin {
                secondMin = first
                secondMinInd = i
            }

            if last > firstMax {
                secondMax = firstMax
                secondMaxInd = firstMaxInd
                firstMax = last
                firstMaxInd = i
            } else if last > secondMax {
                secondMax = last
                secondMaxInd = i
            }
        }

        if firstMinInd != firstMaxInd {
            return firstMax - firstMin
        } else {
            return max(firstMax - secondMin, secondMax - firstMin)
        }
    }
}

