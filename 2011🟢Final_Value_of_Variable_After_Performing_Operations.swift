class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var result = 0
        for i in operations {
            switch i {
                case "++X", "X++": result += 1
                case "--X", "X--": result -= 1
                default: break
            }
        }
        return result
    }
}
