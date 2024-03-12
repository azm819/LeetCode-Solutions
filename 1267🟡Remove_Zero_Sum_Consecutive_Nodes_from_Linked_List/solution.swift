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
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var current = head
        current!.next = removeZeroSumSublists(current!.next)

        var sum = 0
        while let node = current {
            sum += node.val
            if sum == .zero {
                return node.next
            }

            current = current?.next
        }

        return head
    }
}
