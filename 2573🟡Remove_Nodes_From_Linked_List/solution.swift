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
    func removeNodes(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        if let nextNode = removeNodes(head.next) {
            if nextNode.val > head.val {
                return nextNode
            } else {
                head.next = nextNode
                return head
            }
        } else {
            return head
        }
    }
}
