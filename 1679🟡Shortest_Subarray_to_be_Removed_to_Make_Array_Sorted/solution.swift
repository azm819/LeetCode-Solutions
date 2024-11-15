class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var lastRight: Int = .max
        var r = arr.count - 1
        while r >= .zero && arr[r] <= lastRight {
            lastRight = arr[r]
            r -= 1
        }

        guard r >= .zero else {
            return .zero
        }

        r += 1

        var result = r
        var lastLeft: Int = .min
        var l = 0
        while l < arr.count && arr[l] >= lastLeft {
            while r < arr.count && arr[r] < arr[l] {
                r += 1
            }

            result = min(result, r - l - 1)

            lastLeft = arr[l]
            l += 1
        }

        return result
    }
}
