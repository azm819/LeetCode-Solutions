
class MyCircularDeque {
    private final class Node {
        let value: Int
        var next: Node?
        weak var prev: Node?

        init(value: Int, next: Node? = nil, prev: Node? = nil) {
            self.value = value
            self.next = next
            self.prev = prev
        }
    }

    private let maxCount: Int
    private var count: Int = .zero

    private var front: Node?
    private var last: Node?

    init(_ k: Int) {
        maxCount = k
    }

    func insertFront(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }

        let newNode = Node(value: value)
        if isEmpty() {
            front = newNode
            last = newNode
        } else {
            front?.prev = newNode
            newNode.next = front
            front = newNode
        }
        count += 1

        return true
    }

    func insertLast(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }

        let newNode = Node(value: value)
        if isEmpty() {
            front = newNode
            last = newNode
        } else {
            last?.next = newNode
            newNode.prev = last
            last = newNode
        }
        count += 1

        return true
    }

    func deleteFront() -> Bool {
        guard !isEmpty() else {
            return false
        }

        if count == 1 {
            front = nil
            last = nil
        } else {
            front = front?.next
            front?.prev = nil
        }
        count -= 1

        return true
    }

    func deleteLast() -> Bool {
        guard !isEmpty() else {
            return false
        }

        if count == 1 {
            front = nil
            last = nil
        } else {
            last = last?.prev
            last?.next = nil
        }
        count -= 1

        return true
    }

    func getFront() -> Int {
        front?.value ?? -1
    }

    func getRear() -> Int {
        last?.value ?? -1
    }

    func isEmpty() -> Bool {
        count == .zero
    }

    func isFull() -> Bool {
        count == maxCount
    }
}
