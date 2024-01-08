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
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var cur = head?.next
        var result: ListNode?
        var subRes: ListNode?
        var subResVal = 0
        while let node = cur {
            if node.val == .zero {
                let newNode = ListNode(subResVal)
                subResVal = .zero
                subRes?.next = newNode
                subRes = newNode
                result = result ?? subRes
            } else {
                subResVal += node.val
            }
            cur = node.next
        }
        return result
    }
}
