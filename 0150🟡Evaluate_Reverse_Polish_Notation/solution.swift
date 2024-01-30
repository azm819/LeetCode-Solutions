class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            switch token {
            case "+":
                let rhs = stack.removeLast()
                let lhs = stack.removeLast()
                stack.append(lhs + rhs)
            case "-":
                let rhs = stack.removeLast()
                let lhs = stack.removeLast()
                stack.append(lhs - rhs)
            case "*":
                let rhs = stack.removeLast()
                let lhs = stack.removeLast()
                stack.append(lhs * rhs)
            case "/":
                let rhs = stack.removeLast()
                let lhs = stack.removeLast()
                stack.append(lhs / rhs)
            default:
                stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }
}

