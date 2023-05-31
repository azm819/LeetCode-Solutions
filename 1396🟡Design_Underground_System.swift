class UndergroundSystem {

    private var times = [String: [String: [Int]]]()
    private var checks = [Int: (String, Int)]()

    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        checks[id] = (stationName, t)
    }

    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        guard let (from, t1) = checks[id] else { return }
        times[from, default: [:]][stationName, default: []].append(t - t1)
    }

    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let times = times[startStation]![endStation]!
        return Double(times.reduce(0, +)) / Double(times.count)
    }
}


/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */
