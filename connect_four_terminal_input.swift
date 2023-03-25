//
// Created by Au?tin on 25/3/2023.
//

import Foundation

func column_num(_ n:Int) -> String{
    var output = ""
    switch n{
    case 1:
        output = "1️⃣"
    case 2:
        output = "2️⃣"
    case 3:
        output = "3️⃣"
    case 4:
        output = "4️⃣"
    case 5:
        output = "5️⃣"
    case 6:
        output = "6️⃣"
    default:
        output = "7️⃣"
    }
    return output
}

func emoji_judge(_ n:Int) -> String{
    var output = ""
    switch n {
    case 0:
        output = "⚪️"
    case 1:
        output = "🔴️"
    case 2:
        output = "🟡"
    default:
        output = "🏆️"
    }
    return output
}

func grid_print(_ grid_pos: [Int]){
    for _ in 0...6{
        print()
    }
    print("|1️⃣||2️⃣||3️⃣||4️⃣||5️⃣||6️⃣||7️⃣|")
    print()
    var output = ""
    for y in 0...5{
        for x in 0...6{
            output += "|"
            output += emoji_judge(grid_pos[list_pos(x, y)])
            output += "|"
        }
        print("\(output)")
        output = ""
    }
    print()
}

func player_input(_ player:Int) -> Int {
    while true {
        if player == 1 {
            print("What column to put 🔴 (1 - 7): ")
        } else {
            print("What column to put 🟡 (1 - 7): ")
        }

        guard let input = readLine() else {
            print("Failed to read input")
            continue
        }

        if let num = Int8(input.trimmingCharacters(in: .whitespacesAndNewlines)) {
            if num >= 0 && num <= 7 {
                return Int(num)
            } else {
                print("Number is not between 0 and 7. Please try again.")
            }
        } else {
            print("Enter a digit between 1 - 7 (not '\(input)').")
        }
    }
}
