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
    func pairSum(_ head: ListNode?) -> Int {
        var first = head
        var second = head?.next
        while second != nil {
            first = first?.next
            second = second?.next?.next
        }
        var vals = [Int]()
        while let node = first {
            vals.append(node.val)
            first = node.next
        }
        first = head
        var res = 0
        for val in vals.reversed() {
            res = max(res, val + (first?.val ?? .zero))
            first = first?.next
        }
        return res
    }
}
