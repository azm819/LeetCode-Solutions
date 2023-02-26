class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var first = head
        var second = head
        var prevFirst = head
        while second != nil {
            prevFirst = first
            first = first?.next
            second = second?.next?.next
        }
        if first == nil {
            return head
        }
        prevFirst?.next = nil
        first = sortList(first)
        second = sortList(head)
        var result: ListNode?
        var cur: ListNode?
        while let f = first, let s = second {
            if f.val < s.val {
                cur?.next = f
                cur = f
                first = f.next
            } else {
                cur?.next = s
                cur = s
                second = s.next
            }
            if result == nil {
                result = cur
            }
        }
        while let f = first {
            cur?.next = f
            cur = f
            first = f.next
            if result == nil {
                result = cur
            }
        }
        while let s = second {
            cur?.next = s
            cur = s
            second = s.next
            if result == nil {
                result = cur
            }
        }
        return result
    }
}
