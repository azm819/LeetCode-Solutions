class Solution {
    private enum Token: CustomDebugStringConvertible {
        case number(Int)
        case operation((Int, Int) -> Int)

        var debugDescription: String {
            switch self {
            case let .number(num):
                return "\(num)"
            case .operation(_):
                return "f"
            }
        }
    }

    private func eval(_ stack: inout [Token]) {
        guard stack.count > 1,
              case let .number(secondNum) = stack.popLast(),
              case let .operation(fop) = stack.popLast(),
              case let .number(firstNum) = stack.popLast() else {
            return
        }
        stack.append(.number(fop(firstNum, secondNum)))
    }

    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Token]()
        var wasSimple = true
        for ch in s {
            if ch.isWhitespace {
                continue
            }
            if let curNum = ch.wholeNumberValue {
                num = num * 10 + curNum
            } else {
                stack.append(.number(num))
                num = 0
                if !wasSimple {
                    eval(&stack)
                    wasSimple = true
                }
                switch ch {
                case "+":
                    eval(&stack)
                    stack.append(.operation(+))
                    wasSimple = true
                case "-":
                    eval(&stack)
                    stack.append(.operation(-))
                    wasSimple = true
                case "*":
                    stack.append(.operation(*))
                    wasSimple = false
                case "/":
                    stack.append(.operation(/))
                    wasSimple = false
                default:
                    break
                }
            }
        }
        stack.append(.number(num))
        while stack.count > 1 {
            eval(&stack)
        }
        if case let .number(resNum) = stack.popLast() {
            return resNum
        }
        return .zero
    }
}
