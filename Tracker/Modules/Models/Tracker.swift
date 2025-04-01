import UIKit

struct Tracker {
    let id: UUID
    let name: String?
    let color: UIColor?
    let emoji: String?
    let timetable: [Day]?
    let creationDate: Date?
    
    func isEmpty(type: TypeOfEventOrHabit) -> Bool {
        let hasRequiredFields = name?.isEmpty == false && color != nil && emoji != nil
        let isHabitValid = hasRequiredFields && timetable?.isEmpty == false && type == .habit
        let isEventValid = hasRequiredFields && type == .event
        return !(isHabitValid || isEventValid)
    }
    
    init(id: UUID, name: String?, color: UIColor?, emoji: String?, timetable: [Day]?, creationDate: Date?) {
        self.id = id
        self.name = name
        self.color = color
        self.emoji = emoji
        self.timetable = timetable
        self.creationDate = creationDate
    }
    
//    init(coreDataTracker: TrackerCoreData) {
//        
//        guard let id = coreDataTracker.id,
//              let name = coreDataTracker.name,
//              let emoji = coreDataTracker.emoji,
//              let color = coreDataTracker.color,
//              let creationDate = coreDataTracker.creationDate
//        else {
//            fatalError("Some property is nil in Tracker")
//        }
//        let days = coreDataTracker.schedule?.allObjects as? [DayCoreData]
//        let schedule = days?.map {
//            Day(rawValue: $0.day ?? "") ?? .monday
//        }
//        
//        self.id = id
//        self.name = name
////        self.color = convertStringToColor(color) //MARK: color
//        self.color = .red
//        self.emoji = emoji
//        self.timetable = schedule
//        self.creationDate = creationDate
//    }

    
    private func convertStringToColor(_ string: String?) -> UIColor {
        guard let string = string,
              string.hasPrefix("#"),
              string.count == 7
        else {
            return .white
        }
        let hex = String(string.dropFirst())
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
