class Solution {
    private enum Element {
        case number(Int)
        case `operator`((Int, Int) -> Int)
    }

    private func computeValues(
        _ from: Int,
        _ to: Int,
        _ elements: [Element],
        _ memo: inout [[[Int]?]]
    ) -> [Int] {
        guard from != to else {
            guard case let .number(value) = elements[from] else {
                fatalError()
            }

            return [value]
        }

        if let values = memo[from][to] {
            return values
        }

        var values = [Int]()
        for i in from ... to {
            if case let .operator(operation) = elements[i] {
                for lhs in computeValues(from, i - 1, elements, &memo) {
                    for rhs in computeValues(i + 1, to, elements, &memo) {
                        values.append(operation(lhs, rhs))
                    }
                }
            }
        }

        memo[from][to] = values

        return values
    }

    func diffWaysToCompute(_ expression: String) -> [Int] {
        var elements = [Element]()
        var index = expression.startIndex
        while index != expression.endIndex {
            switch expression[index] {
            case "+":
                elements.append(.operator(+))
            case "-":
                elements.append(.operator(-))
            case "*":
                elements.append(.operator(*))
            case "/":
                elements.append(.operator(/))
            default:
                if let lastElement = elements.last, case let .number(value) = lastElement {
                    elements.removeLast()
                    elements.append(.number(value * 10 + expression[index].wholeNumberValue!))
                } else {
                    elements.append(.number(expression[index].wholeNumberValue!))
                }
            }

            index = expression.index(after: index)
        }

        var memo = Array(repeating: Array(repeating: [Int]?.none, count: elements.count), count: elements.count)

        return computeValues(.zero, elements.count - 1, elements, &memo)
    }
}

