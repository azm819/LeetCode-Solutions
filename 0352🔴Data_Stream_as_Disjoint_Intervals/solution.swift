class SummaryRanges {
    private var set = Set<Int>()
    // private var lastResponse: [[Int]]?

    init() { }

    func addNum(_ value: Int) {
        set.insert(value)
        // lastResponse = nil
    }

    func getIntervals() -> [[Int]] {
        // if let lastResponse = lastResponse {
        //     return lastResponse
        // }
        let values = set.sorted()
        var result = [[Int]]()
        var first = -1
        var second = -1
        for value in values {
            if first == -1 {
                first = value
                second = value
            } else if value == second + 1 {
                second = value
            } else {
                result.append([first, second])
                first = value
                second = value
            }
        }
        if first != -1 {
            result.append([first, second])
        }
        // lastResponse = result
        return result
    }
}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(value)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
