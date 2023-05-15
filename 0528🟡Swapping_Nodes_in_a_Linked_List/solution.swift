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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var k = k - 1
        var firstNode = head
        while k > .zero {
            firstNode = firstNode?.next
            k -= 1
        }
        var tail = firstNode?.next
        var secondNode = head
        while tail != nil {
            tail = tail?.next
            secondNode = secondNode?.next
        }
        let val = secondNode?.val
        secondNode?.val = firstNode?.val ?? .zero
        firstNode?.val = val ?? .zero
        return head
    }
}
