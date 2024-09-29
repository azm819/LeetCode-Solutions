
class AllOne {
    private final class Node {
        var keys: Set<String> = Set()
        weak var next: Node?
        var prev: Node?

        let value: Int

        init(next: Node? = nil, prev: Node? = nil, value: Int) {
            self.next = next
            self.prev = prev
            self.value = value
        }
    }

    private var minValueNode: Node?
    private var maxValueNode: Node?
    private var keyToNode: [String: Node] = [:]

    func inc(_ key: String) {
        let newNode: Node

        if let node = keyToNode[key] {
            if let nextNode = node.next {
                if nextNode.value == node.value + 1 {
                    newNode = nextNode
                } else {
                    newNode = Node(value: node.value + 1)
                    newNode.next = nextNode
                    newNode.prev = node
                    node.next = newNode
                    nextNode.prev = newNode
                }
            } else {
                newNode = Node(value: node.value + 1)
                node.next = newNode
                newNode.prev = node
                if node === maxValueNode {
                    maxValueNode = newNode
                }
            }

            node.keys.remove(key)
            if node.keys.isEmpty {
                node.next?.prev = node.prev
                node.prev?.next = node.next
                if node === minValueNode {
                    minValueNode = newNode
                }
            }
        } else if let minValueNode {
            if minValueNode.value > 1 {
                newNode = Node(value: 1)
                newNode.next = minValueNode
                minValueNode.prev = newNode
                self.minValueNode = newNode
            } else {
                newNode = minValueNode
            }
        } else {
            newNode = Node(value: 1)
            minValueNode = newNode
            maxValueNode = newNode
        }

        newNode.keys.insert(key)
        keyToNode[key] = newNode
    }

    func dec(_ key: String) {
        let oldNode = keyToNode[key]!
        if oldNode.value > 1 {
            let newNode: Node
            if let prevNode = oldNode.prev {
                if prevNode.value == oldNode.value - 1 {
                    newNode = prevNode
                } else {
                    newNode = Node(value: oldNode.value - 1)
                    newNode.next = oldNode
                    newNode.prev = prevNode
                    oldNode.prev = newNode
                    prevNode.next = newNode
                }
            } else {
                newNode = Node(value: oldNode.value - 1)
                newNode.next = oldNode
                oldNode.prev = newNode
                minValueNode = newNode
            }

            newNode.keys.insert(key)
            keyToNode[key] = newNode
        } else {
            keyToNode.removeValue(forKey: key)
        }

        oldNode.keys.remove(key)
        if oldNode.keys.isEmpty {
            if oldNode === maxValueNode {
                maxValueNode = oldNode.prev
            }

            if oldNode === minValueNode {
                minValueNode = oldNode.next
            }

            oldNode.next?.prev = oldNode.prev
            oldNode.prev?.next = oldNode.next
        }
    }

    func getMaxKey() -> String {
        maxValueNode?.keys.first ?? ""
    }

    func getMinKey() -> String {
        minValueNode?.keys.first ?? ""
    }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * let obj = AllOne()
 * obj.inc(key)
 * obj.dec(key)
 * let ret_3: String = obj.getMaxKey()
 * let ret_4: String = obj.getMinKey()
 */
