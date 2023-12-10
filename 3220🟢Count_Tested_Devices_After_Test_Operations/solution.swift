class Solution {
    func countTestedDevices(_ batteryPercentages: [Int]) -> Int {
        var devices = 0
        for batteryPercentage in batteryPercentages where batteryPercentage > devices {
            devices += 1
        }
        return devices
    }
}

