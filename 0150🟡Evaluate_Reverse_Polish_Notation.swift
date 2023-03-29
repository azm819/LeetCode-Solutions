class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            switch token {
            case "+":
                let rhs = stack.popLast()!
                let lhs = stack.popLast()!
                stack.append(lhs + rhs)
            case "-":
                let rhs = stack.popLast()!
                let lhs = stack.popLast()!
                stack.append(lhs - rhs)
            case "*":
                let rhs = stack.popLast()!
                let lhs = stack.popLast()!
                stack.append(lhs * rhs)
            case "/":
                let rhs = stack.popLast()!
                let lhs = stack.popLast()!
                stack.append(lhs / rhs)
            default:
                stack.append(Int(token)!)
            }
        }
        return stack.last!
    }
}
