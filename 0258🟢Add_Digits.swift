class Solution {
    func addDigits(_ num: Int) -> Int {
        guard num > 9 else { return num }
        let res = num % 9
        return res == .zero ? 9 : res
    }
}
