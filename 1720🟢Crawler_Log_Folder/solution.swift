class Solution {
    func minOperations(_ logs: [String]) -> Int {
        var depth: Int = .zero
        for log in logs {
            switch log {
            case "../":
                depth = max(.zero, depth - 1)
            case "./":
                break
            default:
                depth += 1
            }
        }

        return depth
    }
}

