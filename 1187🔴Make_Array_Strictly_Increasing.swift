class Solution {
    private func binSearch(_ val: Int, _ arr: [Int]) -> Int {
        guard arr.last! > val else { return -1 }
        var l = 0
        var r = arr.count - 1
        while l < r {
            let c = (l + r) / 2
            if arr[c] > val {
                r = c
            } else {
                l = c + 1
            }
        }
        return arr[r]
    }

    private func dfs(
        _ arr1: [Int],
        _ arr2: [Int],
        _ prev: Int,
        _ curInd: Int,
        _ memo: inout [Int: [Int: Int]]
    ) -> Int {
        guard curInd < arr1.count else { return .zero }
        if let mem = memo[curInd]?[prev] {
            return mem
        }
        var result = 2001
        if arr1[curInd] > prev {
            result = min(result, dfs(arr1, arr2, arr1[curInd], curInd + 1, &memo))
        }
        let minVal = binSearch(prev, arr2)
        if minVal != -1 {
            result = min(result, 1 + dfs(arr1, arr2, minVal, curInd + 1, &memo))
        }
        memo[curInd, default: [:]][prev] = result
        return result
    }

    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let arr2 = arr2.sorted()
        var memo = [Int: [Int: Int]]()
        let result = dfs(arr1, arr2, -1, 0, &memo)
        return result == 2001 ? -1 : result
    }
}

