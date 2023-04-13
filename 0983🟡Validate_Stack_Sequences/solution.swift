class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var popInd = 0
        for push in pushed {
            stack.append(push)
            while popInd < popped.count && stack.last == popped[popInd] {
                stack.removeLast()
                popInd += 1
            }
        }
        return popInd == popped.count
    }
}
