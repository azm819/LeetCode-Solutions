class Solution {
    func makeFancyString(_ s: String) -> String {
        var result = ""
        var preLast: Character?
        var last: Character?
        for ch in s where ch != last || ch != preLast {
            result.append(ch)
            preLast = last
            last = ch
        }

        return result
    }
}

