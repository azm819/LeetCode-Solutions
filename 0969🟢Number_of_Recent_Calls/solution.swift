class RecentCounter {
    private var times = [Int]()
    private var lastValidTime: Int = .zero

    func ping(_ t: Int) -> Int {
        times.append(t)
        var ind = lastValidTime
        while ind < times.count && t - times[ind] > 3000 {
            ind += 1
        }
        lastValidTime = ind
        return times.count - ind
    }
}


/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
