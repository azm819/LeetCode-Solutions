class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        let flowerTimes = zip(plantTime, growTime)
            .map { (plant: $0.0, grow: $0.1) }
            .sorted { $0.grow > $1.grow }

        var maxDays = 0
        var curDay = 0
        for flowerTime in flowerTimes {
            curDay += flowerTime.plant
            maxDays = max(maxDays, curDay + flowerTime.grow)
        }
        return maxDays
    }
}

