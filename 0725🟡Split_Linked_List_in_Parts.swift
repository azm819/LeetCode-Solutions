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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var count = 0
        var cur = head
        while cur != nil {
            count += 1
            cur = cur?.next
        }

        var result = Array(repeating: ListNode?.none, count: k)
        cur = head
        for i in 0 ..< k {
            let left = k - i
            var subCount = (count + left - 1) / left
            count -= subCount
            result[i] = cur
            var prev: ListNode?
            while subCount > .zero {
                prev = cur
                cur = cur?.next
                subCount -= 1
            }
            prev?.next = nil
        }
        return result
    }
}
