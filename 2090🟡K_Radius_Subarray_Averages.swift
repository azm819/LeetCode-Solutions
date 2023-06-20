class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        let diameter = 2 * k + 1
        var result = Array(repeating: -1, count: nums.count)

        guard nums.count >= diameter else { return result }

        var curSum = 0
        for i in 0..<diameter {
            curSum += nums[i]
        }
        var curInd = diameter - 1
        var begInd = 0
        result[curInd - k] = curSum / diameter
        curInd += 1
        while curInd < nums.count {
            curSum -= nums[begInd]
            begInd += 1
            curSum += nums[curInd]
            result[curInd - k] = curSum / diameter

            curInd += 1
        }

        return result
    }
}
