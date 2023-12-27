class Solution {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        var lastColor: Character = " "
        var maxTime = 0
        var sumTime = 0
        var isRemovingNeeded = false
        var result = 0
        var ind = 0
        for color in colors {
            if color == lastColor {
                isRemovingNeeded = true
                maxTime = max(maxTime, neededTime[ind])
                sumTime += neededTime[ind]
            } else {
                if isRemovingNeeded {
                    result += sumTime - maxTime
                    isRemovingNeeded = false
                }
                maxTime = neededTime[ind]
                sumTime = neededTime[ind]
                lastColor = color
            }
            ind += 1
        }
        if isRemovingNeeded {
            result += sumTime - maxTime
        }
        return result
    }
}

