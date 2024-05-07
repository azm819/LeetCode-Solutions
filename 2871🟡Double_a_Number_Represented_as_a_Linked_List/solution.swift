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
    func doubleIt(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }

        let doubledValue = head.val * 2
        let nextVal = head.next?.val ?? .zero
        let nextNode = doubleIt(head.next)
        if nextVal >= 5 {
            head.val = doubledValue % 10 + 1
            head.next = nextNode?.next
        } else {
            head.val = doubledValue % 10
            head.next = nextNode
        }

        if doubledValue >= 10 {
            let oneNode = ListNode(1)
            oneNode.next = head
            return oneNode
        } else {
            return head
        }
    }
}
