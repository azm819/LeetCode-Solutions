class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var isDown = true
        var strs = Array(repeating: [Character](), count: numRows)
        var ind = s.startIndex
        var i = 0
        while ind < s.endIndex {
            strs[i].append(s[ind])
            if isDown {
                if i == numRows - 1 {
                    i = max(.zero, i - 1)
                    isDown.toggle()
                } else {
                    i = min(numRows - 1, i + 1)
                }
            } else {
                if i == .zero {
                    i = min(numRows - 1, i + 1)
                    isDown.toggle()
                } else {
                    i = max(.zero, i - 1)
                }
            }
            ind = s.index(after: ind)
        }
        // for i in strs { print(i) }
        return strs.map { String($0) }.joined()
    }
}

