class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack = [Character]()
        var k = k
        for ch in num {
            while k > .zero, let lastCh = stack.last, lastCh > ch {
                stack.removeLast()
                k -= 1
            }
            if ch != "0" || !stack.isEmpty {
                stack.append(ch)
            }
        }

        while k > .zero {
            stack.popLast()
            k -= 1
        }

        return stack.isEmpty ? "0" : String(stack)
    }
}
