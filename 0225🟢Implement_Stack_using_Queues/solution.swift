class MyStack {
    private class MyCircularQueue {
        private var queue = [Int]()
        private var first = 0
        private var last = 0
        private let k: Int
        private(set) var count = 0

        var isEmpty: Bool {
            count == .zero
        }

        init(_ k: Int = 100) {
            self.k = k
            queue = Array(repeating: -1, count: k)
        }

        func enQueue(_ value: Int) {
            guard count != k else { return }
            queue[last] = value
            last = (last + 1) % k
            count += 1
        }

        func deQueue() -> Int {
            guard !isEmpty else { return -1 }
            var result = queue[first]
            first = (first + 1) % k
            count -= 1
            return result
        }

        func Rear() -> Int {
            guard !isEmpty else { return -1 }
            return queue[(last - 1 + k) % k]
        }
    }

    private var firstQueue = MyCircularQueue()
    private var secondQueue = MyCircularQueue()

    func push(_ x: Int) {
        if secondQueue.isEmpty {
            firstQueue.enQueue(x)
        } else {
            secondQueue.enQueue(x)
        }
    }

    func pop() -> Int {
        if secondQueue.isEmpty {
            while firstQueue.count > 1 {
                secondQueue.enQueue(firstQueue.deQueue())
            }
            return firstQueue.deQueue()
        } else {
            while secondQueue.count > 1 {
                firstQueue.enQueue(secondQueue.deQueue())
            }
            return secondQueue.deQueue()
        }
    }

    func top() -> Int {
        if secondQueue.isEmpty {
            return firstQueue.Rear()
        } else {
            return secondQueue.Rear()
        }
    }

    func empty() -> Bool {
        firstQueue.isEmpty && secondQueue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
