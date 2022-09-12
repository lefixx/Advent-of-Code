print("hello")

sampleBingoCard = {
    {14,86,50,89,49},
    {14,86,50,89,49},
    {14,86,50,89,49},
    {14,86,50,89,49},
    {13,13,13,13,13}
}
local tableWithcalls = {}


function getAllBingos()

    allBingos = {}

    file = io.open("E:/[Code]/AdventofCode/Advent-of-Code/Day4/Bingo Cards.txt","r")
    io.input(file)
    
    local it = 1
    local done = false


    while not done do 
        local bingo = {}
        for i = 1,6 do 
            local contents = io.input().read(file,"l")  -- get a line 
            if i ~= 6 then
                if contents then 
                    contents = splitLinesToTable(contents)   -- split that line
                else done = true 
                end
                bingo[i] = contents   --add line to bingo 
            end
        end
            
        allBingos[it] = bingo
        it = it + 1

    end
    return allBingos
end


function splitLinesToTable(foo)
    local bar = {}
        local i = 1
        for j = 1,14,3 do 
            bar[i] = string.sub(foo,j,j+1)+0
            i = i + 1
        end

    return bar
end

function checkAllForBingos()
    for k,v in ipairs(getAllBingos()) do
        checkForBingo(v)
    end
end

function checkForBingo(bingoCard)
    if checkForHorizontal(bingoCard) or checkForVertical(bingoCard) then
        return true
    end
end

function checkForHorizontal(bingoCard)
    for i,v in ipairs(bingoCard) do  --for every line
        local it = 1
        while it ~= 6 do
            if checkIfCalled(v[it]) then -- if firstone is called check the next one
                it = it + 1
                if it == 6 then return true end  --if all 5 are  then return true
            else
                it = 6
            end
        end 
    end
    return false
end

function checkIfCalled(tableWithCalls,x)
    for i,v in ipairs(tableWithCalls) do
        if x == v then return true end
    end
    return false
end


