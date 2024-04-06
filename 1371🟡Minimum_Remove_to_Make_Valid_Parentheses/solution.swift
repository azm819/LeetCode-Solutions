class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var result = [Character]()
        var count = 0
        for ch in s {
            if ch == "(" {
                count += 1
                result.append(ch)
            } else if ch == ")" {
                if count > 0 {
                    count -= 1
                    result.append(ch)
                }
            } else {
                result.append(ch)
            }
        }

        var ending = [Character]()
        while count > 0 {
            let ch = result.removeLast()
            if ch == "(" {
                count -= 1
            } else {
                ending.append(ch)
            }
        }

        return String(result + ending.reversed())
    }
}
