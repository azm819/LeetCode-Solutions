class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var curGas = 0
        var totalGas = 0
        var result = 0
        for i in 0 ..< gas.count {
            let curDiff = gas[i] - cost[i]
            totalGas += curDiff
            curGas += curDiff
            if curGas < .zero {
                result = i + 1
                curGas = .zero
            }
        }
        return totalGas >= .zero ? result : -1
    }
}
