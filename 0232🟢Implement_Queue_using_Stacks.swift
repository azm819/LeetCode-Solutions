class MyQueue {
    private struct Stack {
        private var list = [Int]()

        var isEmpty: Bool {
            list.isEmpty
        }

        mutating func push(_ x: Int) {
            list.append(x)
        }

        mutating func pop() -> Int {
            list.popLast()!
        }

        mutating func peek() -> Int {
            list.last!
        }
    }

    private var stack1 = Stack()
    private var stack2 = Stack()

    init() {}

    func push(_ x: Int) {
        while !stack2.isEmpty {
            stack1.push(stack2.pop())
        }
        stack1.push(x)
    }

    func pop() -> Int {
        while !stack1.isEmpty {
            stack2.push(stack1.pop())
        }
        return stack2.pop()
    }

    func peek() -> Int {
        while !stack1.isEmpty {
            stack2.push(stack1.pop())
        }
        return stack2.peek()
    }

    func empty() -> Bool {
        stack1.isEmpty && stack2.isEmpty
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
