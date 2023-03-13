class Solution {
    func average(_ salary: [Int]) -> Double {
        var sumS = 0
        var minS = salary[0]
        var maxS = salary[0]
        for sal in salary {
            sumS += sal
            minS = min(minS, sal)
            maxS = max(maxS, sal)
        }
        return Double(sumS - minS - maxS) / Double(salary.count - 2)
    }
}
