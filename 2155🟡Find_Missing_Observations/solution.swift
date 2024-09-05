class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let mSum = rolls.reduce(0, +)
        let nSum = (rolls.count + n) * mean - mSum

        guard nSum >= n && nSum <= n * 6 else {
            return []
        }

        let nNumber = nSum / n
        var result = [Int]()
        for i in 0 ..< nSum - nNumber * n {
            result.append(nNumber + 1)
        }
        while result.count < n {
            result.append(nNumber)
        }

        return result
    }
}
