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
    func reorderList(_ head: ListNode?) {
        var count = 0
        var cur = head
        while cur != nil {
            count += 1
            cur = cur?.next
        }
        var halfCount = (count + 1) / 2 - 1
        cur = head
        while halfCount > .zero {
            cur = cur?.next
            halfCount -= 1
        }
        var secHalf = cur?.next
        var prev: ListNode?
        cur?.next = nil
        while let next = secHalf?.next {
            secHalf?.next = prev
            prev = secHalf
            secHalf = next
        }
        secHalf?.next = prev
        cur = head
        while secHalf != nil {
            let nextCur = cur?.next
            cur?.next = secHalf
            cur = nextCur
            let nextSecHalf = secHalf?.next
            secHalf?.next = nextCur
            secHalf = nextSecHalf
        }
    }
}
