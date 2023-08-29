class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        var customers = Array(customers)
        var curPenalty = 0
        for i in 0 ..< customers.count where customers[i] == "Y" {
            curPenalty += 1
        }
        var minPenalty = curPenalty
        var result = 0
        for i in 0 ..< customers.count {
            if customers[i] == "Y" {
                curPenalty -= 1
            } else {
                curPenalty += 1
            }
            if curPenalty < minPenalty {
                minPenalty = curPenalty
                result = i + 1
            }
        }
        return result
    }
}
