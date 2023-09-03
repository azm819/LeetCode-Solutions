class LRUCache {
    private class Node {
        var prev: Node?
        var next: Node?
        let key: Int
        var value: Int

        init(prev: Node? = nil, next: Node? = nil, key: Int, value: Int) {
            self.prev = prev
            self.next = next
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var head: Node?
    private var tail: Node?
    private var cache: [Int: Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        cutAndAddToHead(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            cutAndAddToHead(node)
        } else {
            let node = Node(key: key, value: value)
            cache[key] = node
            addToHead(node, isNew: true)
        }
    }

    private func cutAndAddToHead(_ node: Node) {
        guard head !== node else { return }

        if tail === node {
            tail = tail?.next
            tail?.prev?.next = nil
            tail?.prev = nil
        } else {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            node.prev = nil
            node.next = nil
        }

        addToHead(node, isNew: false)
    }

    private func addToHead(_ node: Node, isNew: Bool) {
        guard head != nil else {
            head = node
            tail = node
            return
        }

        node.prev = head
        head?.next = node
        head = node

        if isNew && cache.count > capacity {
            cache[tail!.key] = nil
            tail = tail?.next
            tail?.prev?.next = nil
            tail?.prev = nil
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
