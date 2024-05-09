class Solution {
    func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
        let hapiness = happiness.sorted(by: >)
        var result = 0
        for i in 0 ..< min(hapiness.count, k) {
            let subRes = hapiness[i] - i
            if subRes <= .zero {
                break
            }
            result += subRes
        }
        return result
    }
}
