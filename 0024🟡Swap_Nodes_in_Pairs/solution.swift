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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var first = head
        var second = head?.next
        var resNode = head
        while second != nil {
            first?.next = second?.next
            second?.next = first
            prev?.next = second

            if prev == nil {
                resNode = second
            }

            prev = first
            first = first?.next
            second = first?.next
        }
        return resNode
    }
}
