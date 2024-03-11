class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var position = [Character: String.Index]()
        var ind = order.startIndex
        while ind < order.endIndex {
            position[order[ind]] = ind
            ind = order.index(after: ind)
        }
        return String(s.sorted { position[$0, default: order.startIndex] < position[$1, default: order.startIndex] })
    }
}
