class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted()
        var left = 0
        var right = people.count - 1
        var result = 0
        while left <= right {
            if people[left] + people[right] <= limit {
                left += 1
            }
            right -= 1
            result += 1
        }
        return result
    }
}

