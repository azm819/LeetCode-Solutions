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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 1 else { return head }
        guard let head = head else { return nil }
        var prevNode: ListNode?
        var curNode = head
        let oldK = k
        var k = k - 1
        while k > .zero, let nextNode = curNode.next {
            curNode.next = prevNode
            prevNode = curNode
            curNode = nextNode
            k -= 1
        }
        if k == .zero {
            head.next = reverseKGroup(curNode.next, oldK)
            curNode.next = prevNode
            return curNode
        } else {
            while k < oldK - 1 {
                var prevPrevNode = prevNode?.next
                prevNode?.next = curNode
                curNode = prevNode!
                prevNode = prevPrevNode
                k += 1
            }
            return head
        }
    }
}
