class MyCircularQueue {
    private var queue = [Int]()
    private var first = 0
    private var last = 0
    private var count = 0
    private let k: Int

    init(_ k: Int) {
        self.k = k
        queue = Array(repeating: -1, count: k)
    }

    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        queue[last] = value
        last = (last + 1) % k
        count += 1
        return true
    }

    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        first = (first + 1) % k
        count -= 1
        return true
    }

    func Front() -> Int {
        guard !isEmpty() else { return -1 }
        return queue[first]
    }

    func Rear() -> Int {
        guard !isEmpty() else { return -1 }
        return queue[(last - 1 + k) % k]
    }

    func isEmpty() -> Bool {
        count == .zero
    }

    func isFull() -> Bool {
        count == k
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
