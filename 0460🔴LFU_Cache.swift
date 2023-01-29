class Node {
    var prev: Node?
    var next: Node?
    var key: Int
    var value: Int
    var count: Int
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
        self.count = 1
    }
}


class List {
    var head: Node? {
        didSet {
            head?.prev = nil
        }
    }
    var tail: Node? {
        didSet {
            tail?.next = nil
        }
    }
    var count: Int

    var isEmpty: Bool {
        count == .zero
    }

    init() {
        count = .zero
    }

    func insert(_ node: Node) {
        defer { count += 1 }

        guard head != nil else {
            head = node
            tail = node
            return
        }
        node.prev = nil
        node.next = head
        head?.prev = node
        head = node
    }

    func delete(_ node: Node) {
        defer { count -= 1 }

        if count == 1 {
            head = nil
            tail = nil
            return
        }

        if node === head {
            head = head?.next
        }
        if node === tail {
            tail = tail?.prev
        }
        node.next?.prev = node.prev
        node.prev?.next = node.next
    }
}

class LFUCache {
    private var countMap = [Int: List]()
    private var cache = [Int: Node]()
    private var minCount = 0
    private let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard capacity > .zero, let node = cache[key] else { return -1 }
        updateNode(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        guard capacity > .zero else { return }

        if let node = cache[key] {
            updateNode(node)
            node.value = value
        } else {
            if cache.count == capacity,
               let list = countMap[minCount],
               let node = list.tail {
                list.delete(node)
                cache[node.key] = nil
            }
            minCount = 1
            let node = Node(key, value)
            cache[key] = node
            let list = countMap[node.count, default: List()]
            list.insert(node)
            countMap[node.count] = list
        }
    }

    private func updateNode(_ node: Node) {
        let list = countMap[node.count]!
        list.delete(node)

        if list.isEmpty && node.count == minCount {
            minCount += 1
        }

        node.count += 1
        let list2 = countMap[node.count, default: List()]
        list2.insert(node)
        countMap[node.count] = list2
    }
}

