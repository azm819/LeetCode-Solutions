class MyLinkedList {
    private class Node {
        var next: Node?
        var prev: Node?
        let val: Int

        init(val: Int) {
            self.val = val
        }
    }

    private var head: Node?
    private var count = 0

    func get(_ index: Int) -> Int {
        guard index < count else { return -1 }
        var index = index
        var cur = head
        while index > .zero {
            cur = cur?.next
            index -= 1
        }
        return cur?.val ?? -1
    }

    func addAtHead(_ val: Int) {
        let newHead = Node(val: val)
        newHead.next = head
        head?.prev = newHead
        head = newHead
        count += 1
    }

    func addAtTail(_ val: Int) {
        guard head != nil else {
            addAtHead(val)
            return
        }
        let newTail = Node(val: val)
        var cur = head
        while let next = cur?.next {
            cur = next
        }
        cur?.next = newTail
        newTail.prev = cur
        count += 1
    }

    func addAtIndex(_ index: Int, _ val: Int) {
        guard index <= count else { return }
        guard index > .zero else {
            addAtHead(val)
            return
        }
        let newNode = Node(val: val)
        var index = index - 1
        var cur = head
        while index > .zero {
            cur = cur?.next
            index -= 1
        }
        cur?.next?.prev = newNode
        newNode.next = cur?.next
        newNode.prev = cur
        cur?.next = newNode
        count += 1
    }

    func deleteAtIndex(_ index: Int) {
        guard index < count else { return }
        guard index > .zero else {
            head = head?.next
            head?.prev = nil
            count -= 1
            return
        }
        var index = index
        var cur = head
        while index > .zero {
            cur = cur?.next
            index -= 1
        }
        cur?.next?.prev = cur?.prev
        cur?.prev?.next = cur?.next
        count -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
