class Solution {
    private func isGreater(
        _ i: Int,
        _ j: Int,
        _ heap: [Int],
        _ indToWord: [Int: String]
    ) -> Bool {
        let iW = indToWord[i]!
        let jW = indToWord[j]!
        return heap[i] > heap[j] || heap[i] == heap[j] && iW < jW
    }

    private func shiftUp(
        _ ind: Int,
        _ heap: inout [Int],
        _ wordToInd: inout [String: Int],
        _ indToWord: inout [Int: String]
    ) {
        let par = (ind - 1) / 2
        if isGreater(ind, par, heap, indToWord) {
            let childW = indToWord[ind]!
            let parW = indToWord[par]!
            wordToInd[childW] = par
            wordToInd[parW] = ind
            indToWord[ind] = parW
            indToWord[par] = childW
            heap.swapAt(ind, par)
            shiftUp(par, &heap, &wordToInd, &indToWord)
        }
    }

    private func shiftDown(
        _ ind: Int,
        _ heap: inout [Int],
        _ wordToInd: inout [String: Int],
        _ indToWord: inout [Int: String]
    ) {
        let left = 2 * ind + 1
        guard left < heap.count else { return }
        let right = 2 * ind + 2
        if right < heap.count {
            if isGreater(left, right, heap, indToWord) {
                if isGreater(left, ind, heap, indToWord) {
                    heap.swapAt(ind, left)
                    let iW = indToWord[ind]!
                    let lW = indToWord[left]!
                    wordToInd[iW] = left
                    wordToInd[lW] = ind
                    indToWord[ind] = lW
                    indToWord[left] = iW
                    shiftDown(left, &heap, &wordToInd, &indToWord)
                }
            } else {
                if isGreater(right, ind, heap, indToWord) {
                    heap.swapAt(ind, right)
                    let iW = indToWord[ind]!
                    let rW = indToWord[right]!
                    wordToInd[iW] = right
                    wordToInd[rW] = ind
                    indToWord[ind] = rW
                    indToWord[right] = iW
                    shiftDown(right, &heap, &wordToInd, &indToWord)
                }
            }
        } else {
            if isGreater(left, ind, heap, indToWord) {
                heap.swapAt(ind, left)
                let iW = indToWord[ind]!
                let lW = indToWord[left]!
                wordToInd[iW] = left
                wordToInd[lW] = ind
                indToWord[ind] = lW
                indToWord[left] = iW
                shiftDown(left, &heap, &wordToInd, &indToWord)
            }
        }
    }

    private func extractMax(
        _ heap: inout [Int],
        _ wordToInd: inout [String: Int],
        _ indToWord: inout [Int: String]
    ) -> String {
        let i = 0
        let j = heap.count - 1
        let iW = indToWord[i]!
        let jW = indToWord[j]!
        wordToInd[iW] = j
        wordToInd[jW] = i
        indToWord[i] = jW
        indToWord[j] = iW
        heap[i] = 0
        heap.swapAt(i, j)
        shiftDown(i, &heap, &wordToInd, &indToWord)
        return iW
    }

    private func insert(
        _ key: Int,
        _ heap: inout [Int],
        _ wordToInd: inout [String: Int],
        _ indToWord: inout [Int: String]
    ) {
        heap.append(key)
        shiftUp(heap.count - 1, &heap, &wordToInd, &indToWord)
    }

    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var wordToInd = [String: Int]()
        var indToWord = [Int: String]()
        var heap = [Int]()
        for word in words {
            if let ind = wordToInd[word] {
                heap[ind] += 1
                shiftUp(ind, &heap, &wordToInd, &indToWord)
            } else {
                wordToInd[word] = heap.count
                indToWord[heap.count] = word
                insert(1, &heap, &wordToInd, &indToWord)
            }
        }
        var result = [String]()
        for _ in 0..<k {
            result.append(extractMax(&heap, &wordToInd, &indToWord))
        }
        return result
    }
}
