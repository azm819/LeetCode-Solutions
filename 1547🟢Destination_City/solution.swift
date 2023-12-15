class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var sources = Set<String>()
        var destinations = Set<String>()
        for path in paths {
            sources.insert(path[0])
            destinations.insert(path[1])
        }
        return destinations.subtracting(sources).first!
    }
}
