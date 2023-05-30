class MyHashSet {

    private var set = Array(repeating: false, count: 1_000_001)

    func add(_ key: Int) {
        set[key] = true
    }

    func remove(_ key: Int) {
        set[key] = false
    }

    func contains(_ key: Int) -> Bool {
        set[key]
    }
}


/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
