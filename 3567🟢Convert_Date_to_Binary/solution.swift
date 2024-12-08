import Foundation

class Solution {
    private func convertToBinary(_ num: Int) -> String {
        var num = num
        var result = ""
        while num > .zero {
            result.append(String(num % 2))
            num /= 2
        }

        return String(result.reversed())
    }

    func convertDateToBinary(_ date: String) -> String {
        var ind = date.startIndex

        var year = 0
        while date[ind] != "-" {
            year = year * 10 + date[ind].wholeNumberValue!
            ind = date.index(after: ind)
        }
        ind = date.index(after: ind)

        var month = 0
        while date[ind] != "-" {
            month = month * 10 + date[ind].wholeNumberValue!
            ind = date.index(after: ind)
        }
        ind = date.index(after: ind)

        var day = 0
        while ind != date.endIndex {
            day = day * 10 + date[ind].wholeNumberValue!
            ind = date.index(after: ind)
        }

        return "\(convertToBinary(year))-\(convertToBinary(month))-\(convertToBinary(day))"
    }
}
