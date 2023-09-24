class Solution {
    func numberOfEmployeesWhoMetTarget(_ hours: [Int], _ target: Int) -> Int {
        hours.reduce(0) { partialResult, hour in
            hour >= target ? partialResult + 1 : partialResult
        }
    }
}

