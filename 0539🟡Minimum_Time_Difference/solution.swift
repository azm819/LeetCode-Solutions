import Foundation

class Solution {
    private static let MAX_TIME = 24 * 60

    func findMinDifference(_ timePoints: [String]) -> Int {
        var points = Array(repeating: false, count: Solution.MAX_TIME)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let calendar = Calendar.current
        for timePoint in timePoints {
            let date = dateFormatter.date(from: timePoint)!
            let hours = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let time = hours * 60 + minutes

            if points[time] {
                return .zero
            } else {
                points[time] = true
            }
        }

        var firstTime: Int?
        var lastTime: Int?
        var result = Solution.MAX_TIME - 1
        for time in 0 ..< Solution.MAX_TIME where points[time] {
            if let firstTime = firstTime {
                result = min(result, Solution.MAX_TIME - time + firstTime)
            }

            if let lastTime = lastTime {
                result = min(result, time - lastTime)
            }

            firstTime = firstTime ?? time
            lastTime = time
        }

        return result
    }
}
