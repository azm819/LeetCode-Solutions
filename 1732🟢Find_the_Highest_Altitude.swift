class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var maxLat = 0
        var prevLat = 0
        for diff in gain {
            prevLat += diff
            maxLat = max(maxLat, prevLat)
        }
        return maxLat
    }
}
