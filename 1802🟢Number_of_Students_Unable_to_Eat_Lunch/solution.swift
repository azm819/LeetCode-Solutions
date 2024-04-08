class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var circularCount = 0
        var squareCount = 0
        for student in students {
            if student == 0 {
                circularCount += 1
            } else {
                squareCount += 1
            }
        }

        var ind = 0
        while ind < sandwiches.count {
            if sandwiches[ind] == 0 {
                if circularCount > 0 {
                    circularCount -= 1
                    ind += 1
                } else {
                    break
                }
            } else {
                if squareCount > 0 {
                    squareCount -= 1
                    ind += 1
                } else {
                    break
                }
            }
        }

        return sandwiches.count - ind
    }
}

