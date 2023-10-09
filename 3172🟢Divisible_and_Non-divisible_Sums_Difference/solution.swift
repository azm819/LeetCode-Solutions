class Solution {
    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        let allSum = n * (n + 1) / 2
        let divCount = n / m
        let divSum = divCount * (divCount + 1) / 2 * m
        return allSum - 2 * divSum
    }
}
