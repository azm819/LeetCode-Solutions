class MyQueue {
    private class Node {
        var prev: Node?
        var next: Node?
        let val: Int

        init(val: Int) {
            self.val = val
        }
    }
    private var head: Node?
    private var tail: Node?

    func push(_ x: Int) {
        var node = Node(val: x)
        if empty() {
            head = node
            tail = node
        } else {
            node.next = head
            head?.prev = node
            head = node
        }
    }

    func pop() -> Int {
        defer {
            tail = tail?.prev
            tail?.next = nil
            if tail == nil {
                head = nil
            }
        }
        return peek()
    }

    func peek() -> Int {
        tail!.val
    }

    func empty() -> Bool {
        head == nil
    }
}


/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
