class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var edges = [String: [String]]()
        for ticket in tickets {
            edges[ticket[0], default: []].append(ticket[1])
        }
        edges.forEach { (key: String, value: [String]) in
            edges[key] = value.sorted(by: >)
        }
        var result = [String]()
        var queue = ["JFK"]
        while let port = queue.last {
            if let nextPort = edges[port]?.popLast() {
                queue.append(nextPort)
            } else {
                result.append(port)
                queue.removeLast()
            }
        }
        return result.reversed()
    }
}
