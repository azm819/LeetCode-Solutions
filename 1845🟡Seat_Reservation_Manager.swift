class SeatManager {
    private var heap: [Int]

    init(_ n: Int) {
        heap = Array(stride(from: n, through: 1, by: -1))
    }

    func reserve() -> Int {
        heap.removeLast()
    }

    func unreserve(_ seatNumber: Int) {
        heap.append(seatNumber)
        heap.sort(by: >)
    }
}

/**
 * Your SeatManager object will be instantiated and called as such:
 * let obj = SeatManager(n)
 * let ret_1: Int = obj.reserve()
 * obj.unreserve(seatNumber)
 */
