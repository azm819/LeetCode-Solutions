class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        let diff = right - left
        var result = 0
        var pow = 1
        while pow <= right {
            if pow > diff && (left / pow) % 2 == 1 && (left / pow == right / pow) {
                result += pow
            }
            pow *= 2
        }
        return result
    }
}
