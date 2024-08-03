class OrderedStream {
    var stream: [Int: String]
    var pointer: Int

    init(_ n: Int) {
        stream = [:]
        pointer = 1
    }

    func insert(_ idKey: Int, _ value: String) -> [String] {
        stream[idKey] = value

        var chunk = [String]()
        while let pointerValue = stream[pointer] {
            chunk.append(pointerValue)
            stream[pointer] = nil
            pointer += 1
        }
        return chunk
    }
}

/**
 * Your OrderedStream object will be instantiated and called as such:
 * let obj = OrderedStream(n)
 * let ret_1: [String] = obj.insert(idKey, value)
 */
