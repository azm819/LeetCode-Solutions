class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        zip(seats.sorted(), students.sorted()).reduce(0) { partialResult, pair in
            return partialResult + abs(pair.0 - pair.1)
        }
    }
}

