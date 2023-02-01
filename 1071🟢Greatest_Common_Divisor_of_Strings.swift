class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if a == b {
            return a
        } else if a > b {
            return gcd(a - b, b)
        } else {
            return gcd(a, b - a)
        }
    }

    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let gcdLen = gcd(str1.count, str2.count)
        var result = [Character]()
        var ind = str1.startIndex
        while result.count < gcdLen {
            if str1[ind] == str2[ind] {
                result.append(str1[ind])
                ind = str1.index(after: ind)
            } else {
                break
            }
        }
        let res = String(result)
        guard !res.isEmpty else { return "" }
        let res1 = Array(repeating: res, count: str1.count / res.count).joined()
        let res2 = Array(repeating: res, count: str2.count / res.count).joined()
        if str1 == res1 && str2 == res2 {
            return res
        }
        return ""
    }
}
