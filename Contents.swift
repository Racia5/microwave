import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Microwave {
    var timer: Timer?
    var count = 0
    var limit = 0
    
    /// wattage: ワット数、time: 時間（秒）
    func start(wattage: Int, time: Int) {
        limit = time
        print("\(wattage)Wで\(calcTime(time: time))分の温めを開始します")
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(countUp),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func calcTime(time: Int) -> Int {
        return time / 60
    }
    
    @objc func countUp() {
        count += 1
        
        if count % 10 == 0 {
            print("\(count)秒経過")
        }
        
        if limit <= count {
            print("温めが完了しました")
            timer?.invalidate()
        }
    }
}

let microwave = Microwave()
microwave.start(wattage: 500, time: 60)

