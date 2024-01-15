class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var winners = Set<Int>()
        var allLosers = Set<Int>()
        var oneGameLosers = Set<Int>()
        for match in matches {
            winners.insert(match[0])
            if allLosers.insert(match[1]).inserted {
                oneGameLosers.insert(match[1])
            } else {
                oneGameLosers.remove(match[1])
            }
        }
        return [Array(winners.subtracting(allLosers)).sorted(), Array(oneGameLosers).sorted()]
    }
}

