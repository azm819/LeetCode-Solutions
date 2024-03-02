class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var negSquares = [Int]()
        var posSquares = [Int]()
        for num in nums {
            let square = num * num
            if num < .zero {
                negSquares.append(square)
            } else {
                posSquares.append(square)
            }
        }

        var result = [Int]()
        var i = negSquares.count - 1
        var j = 0
        while i >= 0 && j < posSquares.count {
            if negSquares[i] < posSquares[j] {
                result.append(negSquares[i])
                i -= 1
            } else {
                result.append(posSquares[j])
                j += 1
            }
        }

        while i >= 0 {
            result.append(negSquares[i])
            i -= 1
        }

        while j < posSquares.count {
            result.append(posSquares[j])
            j += 1
        }

        return result
    }
}

