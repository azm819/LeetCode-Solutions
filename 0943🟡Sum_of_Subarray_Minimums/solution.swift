class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var stack = [(Int, Int)]()
        var result = 0
        for i in 0 ..< arr.count {
            while let (val, _) = stack.last, val > arr[i] {
                stack.removeLast()
            }
            stack.append((arr[i], i))
            var lastInd = -1
            for (val, ind) in stack {
                result += val * (ind - lastInd)
                result %= 1_000_000_007
                lastInd = ind
            }
        }
        return result
    }
}

