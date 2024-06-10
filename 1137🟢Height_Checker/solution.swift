class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        zip(heights, heights.sorted()).reduce(0) { partialResult, element in
            element.0 != element.1 ? partialResult + 1 : partialResult
        }
    }
}

