class Solution {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var heap = [Fraction]()
        for i in 0 ..< arr.count - 1 {
            for j in i + 1 ..< arr.count {
                insert(Fraction(numerator: arr[i], denominator: arr[j]), &heap)
            }
        }

        var result: Fraction = Fraction(numerator: .zero, denominator: .zero)
        for _ in 1 ... k {
            result = popMin(&heap)
        }
        return [result.numerator, result.denominator]
    }
}

private extension Solution {
    struct Fraction: Comparable {
        let numerator: Int
        let denominator: Int

        static func < (lhs: Fraction, rhs: Fraction) -> Bool {
            lhs.numerator * rhs.denominator < rhs.numerator * lhs.denominator
        }
    }

    func siftUp(_ ind: Int, _ heap: inout [Fraction]) {
        let par = (ind - 1) / 2
        if heap[ind] < heap[par] {
            heap.swapAt(ind, par)
            siftUp(par, &heap)
        }
    }

    func siftDown(_ ind: Int, _ heap: inout [Fraction]) {
        let left = 2 * ind + 1
        guard left < heap.count else { return }
        let right = 2 * ind + 2
        if right < heap.count {
            if heap[left] < heap[right] {
                if heap[ind] > heap[left] {
                    heap.swapAt(ind, left)
                    siftDown(left, &heap)
                }
            } else {
                if heap[ind] > heap[right] {
                    heap.swapAt(ind, right)
                    siftDown(right, &heap)
                }
            }
        } else {
            if heap[ind] > heap[left] {
                heap.swapAt(ind, left)
                siftDown(left, &heap)
            }
        }
    }

    func insert(_ key: Fraction, _ heap: inout [Fraction]) {
        heap.append(key)
        siftUp(heap.count - 1, &heap)
    }

    func popMin(_ heap: inout [Fraction], _ newHead: Fraction = Fraction(numerator: 1, denominator: 1)) -> Fraction {
        let minimum = heap[0]
        heap[0] = newHead
        siftDown(.zero, &heap)
        return minimum
    }
}

