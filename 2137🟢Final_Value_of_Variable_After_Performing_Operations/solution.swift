class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        operations.reduce(0) { partialResult, operation in
            operation == "++X" || operation == "X++" ? partialResult + 1 : partialResult - 1
        }
    }
}

