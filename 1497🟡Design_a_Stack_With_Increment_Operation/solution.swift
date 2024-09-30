
class CustomStack {
    private let maxSize: Int
    private var incrementingValues: [Int]
    private var stack: [Int]

    init(_ maxSize: Int) {
        self.maxSize = maxSize
        incrementingValues = Array(repeating: Int.zero, count: maxSize)
        stack = []
    }

    func push(_ x: Int) {
        guard stack.count < maxSize else { return }
        stack.append(x)
    }

    func pop() -> Int {
        guard let lastValue = stack.popLast() else {
            return -1
        }

        if !stack.isEmpty {
            incrementingValues[stack.count - 1] += incrementingValues[stack.count]
        }

        defer {
            incrementingValues[stack.count] = .zero
        }

        return lastValue + incrementingValues[stack.count]
    }

    func increment(_ k: Int, _ val: Int) {
        guard !stack.isEmpty else { return }
        incrementingValues[min(k, stack.count) - 1] += val
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */
