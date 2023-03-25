//
// Created by Au?tin on 25/3/2023.
//

import Foundation

let rules = [-1, 0, -1, -1, 0, -1, 1, -1, 1, 0, 1, 1, 0, 1, -1, 1]

func list_pos(_ x:Int, _ y:Int) -> Int{
    (y * 7) + x
}

func move_update(_ row:Int, _ player:Int, _ grid_pos: inout [Int]) -> [Int]{
    var y = 5
    while y >= 0{
        if grid_pos[list_pos(row ,y)] == 0{
            grid_pos[list_pos(row, y)] = player
            return grid_pos
        }else{
            y -= 1
        }
    }
    print("OVERFLOW!!")
    return grid_pos
}

func player_switch(_ player:Int) -> Int{
    if player == 1{
        return 2
    }else{
        return 1
    }
}

func bound_x(_ x: Int) -> Bool{
    if x >= 0  && x <= 6{
        return true
    }else{
        return false
    }
}

func bound_y(_ y: Int) -> Bool{
    if y >= 0  && y <= 5{
        return true
    }else{
        return false
    }
}

func neighbour(_ x: Int, _ y: Int, _ grid_pos: inout [Int]){
    var y = y
    var x = x
    let original_x = x
    let original_y = y
    var state = 0
    var winners = Array(repeating: 0, count: 8)
    if grid_pos[list_pos(x, y)] == 1{
        state = 1
    }else if grid_pos[list_pos(x, y)] == 2{
        state = 2
    }else{
        return
    }
    for laws in 1...8{
        var tally = 0
        let rule_x = rules[(laws * 2) - 2]
        let rule_y = rules[(laws * 2) - 1]
        winners = Array(repeating: 0, count: 8)
        x = original_x
        y = original_y
        while (bound_x(x) && bound_y(y)) == true && grid_pos[list_pos(x, y)] == state{
            tally += 1
            winners[(tally * 2) - 2] = x
            winners[(tally * 2) - 1] = y
            if tally >= 4{
                for win in 1...4{
                    let win_x = winners[(win * 2) - 2]
                    let win_y = winners[(win * 2) - 1]
                    grid_pos[list_pos(win_x, win_y)] = 3
                }
                if state == 1{
                    grid_print(grid_pos)
                    print("Congratulations 🔴, you are the WINNER!")
                    exit(0)
                }else{
                    grid_print(grid_pos)
                    print("Congratulations 🟡, you are the WINNER!")
                    exit(0)
                }
            }
            x += rule_x
            y += rule_y
        }
    }
}

func main(){
    var grid_pos = Array(repeating: 0, count: 42)
    var tie = 0
    var player = 1
    grid_print(grid_pos)
    var row = 1
    while tie < 42{
        row = player_input(player) - 1
        while grid_pos[row] != 0{
            print("Oops, column \(column_num(row)) is already full.")
            row = player_input(player) - 1
        }
        grid_pos = move_update(row, player, &grid_pos)
        tie += 1
        grid_print(grid_pos)
        player = player_switch(player)
        for y in 0...5{
            for x in 0...6{
                neighbour(x, y, &grid_pos)
            }
        }
    }
    grid_print(grid_pos)
    print("TIE!")
    exit(0)
}


