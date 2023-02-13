class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        let cnt = high - low + 1
        if cnt % 2 == 1 && low % 2 == 1 {
            return cnt / 2 + 1
        }
        return cnt / 2
    }
}
