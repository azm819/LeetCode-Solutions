class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        let sortedScores = score.enumerated().sorted { $0.element > $1.element }
        var result = Array(repeating: "", count: score.count)
        var place = 1
        for (index, _) in sortedScores {
            let placeResult: String
            switch place {
            case 1:
                placeResult = "Gold Medal"
            case 2:
                placeResult = "Silver Medal"
            case 3:
                placeResult = "Bronze Medal"
            default:
                placeResult = "\(place)"
            }
            result[index] = placeResult
            place += 1
        }
        return result
    }
}
