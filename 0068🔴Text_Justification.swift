class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [[String]]()
        var wordsWidths = [Int]()
        var curLine = [String]()
        var curWidth = 0
        var wordsWidth = 0
        for word in words {
            if curWidth + word.count <= maxWidth {
                curLine.append(word)
                curWidth += word.count + 1
                wordsWidth += word.count
            } else {
                result.append(curLine)
                wordsWidths.append(wordsWidth)
                curLine = [word]
                curWidth = word.count + 1
                wordsWidth = word.count
            }
        }
        result.append(curLine)
        return result.enumerated().map { index, line in
            guard index != result.count - 1 else {
                var subRes = ""
                for i in 0 ..< line.count {
                    subRes += line[i]
                    if subRes.count < maxWidth {
                        subRes += " "
                    }
                }
                while subRes.count < maxWidth {
                    subRes += " "
                }
                return subRes
            }
            var leftSpaces = maxWidth - wordsWidths[index]
            var subRes = ""
            for i in 0 ..< line.count {
                subRes += line[i]
                if i != line.count - 1 {
                    let spacesPlaces = line.count - 1 - i
                    let spacesCount = (leftSpaces + spacesPlaces - 1) / spacesPlaces
                    leftSpaces -= spacesCount
                    for _ in 1 ... spacesCount {
                        subRes += " "
                    }
                }
            }
            while subRes.count < maxWidth {
                subRes += " "
            }
            return subRes
        }
    }
}
