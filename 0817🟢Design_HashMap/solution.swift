class MyHashMap {
    private var values = Array(repeating: -1, count: 1_000_001)

    func put(_ key: Int, _ value: Int) {
        values[key] = value
    }

    func get(_ key: Int) -> Int {
        values[key]
    }

    func remove(_ key: Int) {
        values[key] = -1
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
