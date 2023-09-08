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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left < right else { return head }

        var left = left
        var right = right
        var stack = [ListNode]()
        var cur = head
        var prev: ListNode?
        while let node = cur {
            left -= 1
            right -= 1
            if left <= .zero {
                stack.append(node)
                if right == .zero {
                    var revPrev = prev
                    let firstInChain = stack.last
                    let afterChain = node.next
                    while let revNode = stack.popLast() {
                        revPrev?.next = revNode
                        revPrev = revNode
                    }
                    revPrev?.next = afterChain
                    return prev == nil ? firstInChain : head
                }
            } else {
                prev = node
            }
            cur = node.next
        }
        return nil
    }
}
