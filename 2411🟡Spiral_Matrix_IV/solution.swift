/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    private enum Direction {
        case right
        case down
        case left
        case up
    }

    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var result = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        var i = 0
        var j = 0
        var minI = 0
        var maxI = m - 1
        var minJ = 0
        var maxJ = n - 1

        var curNode = head
        var direction: Direction = .right

        while let node = curNode {
            result[i][j] = node.val
            curNode = node.next

            switch direction {
            case .right:
                if j == maxJ {
                    minI += 1
                    i += 1
                    direction = .down
                    break
                } else {
                    j += 1
                }
            case .down:
                if i == maxI {
                    maxJ -= 1
                    j -= 1
                    direction = .left
                    break
                } else {
                    i += 1
                }
            case .left:
                if j == minJ {
                    maxI -= 1
                    i -= 1
                    direction = .up
                    break
                } else {
                    j -= 1
                }
            case .up:
                if i == minI {
                    minJ += 1
                    j += 1
                    direction = .right
                    break
                } else {
                    i -= 1
                }
            }
        }

        return result
    }
}
