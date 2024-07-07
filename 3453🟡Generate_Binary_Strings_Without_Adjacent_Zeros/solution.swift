class Solution {
    private func generateStrings(_ n: Int, _ current: inout String, _ result: inout [String]) {
        guard current.count < n else {
            result.append(current)
            return
        }

        if current.last == "0" {
            current.append("1")
            generateStrings(n, &current, &result)
            current.removeLast()
        } else {
            current.append("0")
            generateStrings(n, &current, &result)
            current.removeLast()
            current.append("1")
            generateStrings(n, &current, &result)
            current.removeLast()
        }
    }

    func validStrings(_ n: Int) -> [String] {
        var current = String()
        var result = [String]()
        generateStrings(n, &current, &result)
        return result
    }
}

