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
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard b != .zero else { return a }
        return gcd(b, a % b)
    }

    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var cur = head
        var prev: ListNode?
        while let node = cur {
            if let prev = prev {
                let newNode = ListNode(gcd(prev.val, node.val))
                prev.next = newNode
                newNode.next = node
            }
            prev = cur
            cur = node.next
        }
        return head
    }
}
