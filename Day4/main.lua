print("hello")

function getFirstBingo()
    bingo = {}

    file = io.open("E:/[Code]/AdventofCode/Advent-of-Code/Day4/Bingo Cards.txt","r")
    io.input(file)
    
    
    
    for i = 1,5 do 
        local contents = io.input().read(file,"l")
        print(contents)
        bingo{i} = contents
    end
    
    return bingo
end


print(getFirstBingo())

