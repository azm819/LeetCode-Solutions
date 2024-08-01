class Solution {
    private struct Passenger {
        enum Gender: Character {
            case female = "F"
            case male = "M"
            case other = "O"
        }

        let phoneNumber: String
        let gender: Gender
        let age: Int
        let seat: Int

        init(_ details: String) {
            var ind = details.startIndex

            var count: Int = .zero
            var phoneNumber = ""
            while count < 10 {
                phoneNumber.append(details[ind])

                count += 1
                ind = details.index(after: ind)
            }
            self.phoneNumber = phoneNumber

            self.gender = Gender(rawValue: details[ind])!
            ind = details.index(after: ind)

            count = .zero
            var age: Int = .zero
            while count < 2 {
                age = age * 10 + details[ind].wholeNumberValue!

                count += 1
                ind = details.index(after: ind)
            }
            self.age = age

            count = .zero
            var seat: Int = .zero
            while count < 2 {
                seat = seat * 10 + details[ind].wholeNumberValue!

                count += 1
                ind = details.index(after: ind)
            }
            self.seat = seat
        }
    }

    func countSeniors(_ details: [String]) -> Int {
        details.map(Passenger.init).filter { $0.age > 60 }.count
    }
}

