class MinStack {
    private var stack = [(element: Int, min: Int)]()

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
        } else {
            stack.append((val, min(val, getMin())))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        stack.last!.element
    }
    
    func getMin() -> Int {
        stack.last!.min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
