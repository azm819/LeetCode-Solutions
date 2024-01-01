class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let greeds = g.sorted()
        let sizes = s.sorted()
        var gI = 0
        var sI = 0
        var result = 0
        while gI < greeds.count && sI < sizes.count {
            if sizes[sI] >= greeds[gI] {
                result += 1
                gI += 1
            }
            sI += 1
        }
        return result
    }
}

