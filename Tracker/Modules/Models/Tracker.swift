import UIKit

struct Tracker {
    let id: UUID
    let name: String?
    let color: UIColor?
    let emoji: Character?
    let timetable: [Day]?
    let creationDate: Date?
    
    func isEmpty(type: TypeOfEventOrHabit) -> Bool {
        if self.name != nil && !(self.name == "") && self.color != nil &&
            self.emoji != nil && self.timetable != nil &&
            !(self.timetable?.isEmpty ?? true) && type == .habit {
            
            return false
        } else if self.name != nil && !(self.name == "") &&
                    self.color != nil && self.emoji != nil && type == .event {
            
            return false
        }
        
        return true
    }
}
