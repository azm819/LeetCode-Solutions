class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [(Int, Int)]()
        var answer = Array(repeating: 0, count: temperatures.count)
        for (ind, temperature) in temperatures.enumerated() {
            while let (lastT, lastInd) = stack.last, lastT < temperature {
                stack.removeLast()
                answer[lastInd] = ind - lastInd
            }
            stack.append((temperature, ind))
        }
        return answer
    }
}
