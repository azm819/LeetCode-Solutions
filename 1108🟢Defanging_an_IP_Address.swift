class Solution {
    func defangIPaddr(_ address: String) -> String {
        var result = [Character]()
        for i in address {
            if i == "." {
                result += ["[", ".", "]"]
            } else {
                result.append(i)
            }
        }
        return String(result)
    }
}
