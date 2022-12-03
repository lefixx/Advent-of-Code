print("-=START=-")

sampleBingoCard = {
    {99,24,34,14,54},
    {15,86,50,15,49},
    {16,86,50,16,49},
    {17,86,50,17,49},
    {18,13,50,18,13}
}

local tableWithcalls = {}
local allCalls = {13,79,74,35,76,12,43,71,87,72,23,91,31,67,58,61,96,16,81,92,41,6,32,86,77,42,0,55,68,14,53,26,25,11,45,94,75,1,93,83,52,7,4,22,34,64,69,88,65,66,39,97,27,29,78,5,49,82,54,46,51,28,98,36,48,15,2,50,38,24,89,59,8,3,18,47,10,90,21,80,73,33,85,62,19,37,57,95,60,20,99,17,63,56,84,44,40,70,9,30}




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
            if contents == "end" then 
                done = true 
            elseif contents then 
                if i ~= 6 then
                    contents = splitLinesToTable(contents)   -- split that lines numbers into a table
                end
                bingo[i] = contents
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

function checkAllForBingos(tableWithCalls)
    local allBingoes = getAllBingos()
    local allWinningBingoes = {}
    for k,bingoCard in ipairs(allBingoes) do
        if checkCardForBingo(bingoCard,tableWithCalls) then
            table.insert(allWinningBingoes, {k,bingoCard})
        end
    end
    return allWinningBingoes
end

function checkForHorizontal(bingoCard,tableWithCalls)
    for i,v in ipairs(bingoCard) do  --for every line
        local it = 1
        while it ~= 6 do
            if checkIfCalled(v[it],tableWithCalls) then -- if firstone is called check the next one
                it = it + 1
                if it == 6 then return true end  --if all 5 are  then return true
                else
                    it = 6
            end
        end 
    end
    return false
end

function checkIfCalled(x,tableWithCalls)
    for i,v in ipairs(tableWithCalls) do
        if x == v then return true end
    end
    return false
end

function getCalls(amount)
    local calledNumbers = {}
    local allNumbers = {13,79,74,35,76,12,43,71,87,72,23,91,31,67,58,61,96,16,81,92,41,6,32,86,77,42,0,55,68,14,53,26,25,11,45,94,75,1,93,83,52,7,4,22,34,64,69,88,65,66,39,97,27,29,78,5,49,82,54,46,51,28,98,36,48,15,2,50,38,24,89,59,8,3,18,47,10,90,21,80,73,33,85,62,19,37,57,95,60,20,99,17,63,56,84,44,40,70,9,30}
    for i = 1,amount do
        calledNumbers[i] = allNumbers[i]
    end
    return calledNumbers
end

function checkNumbersForBingo(numbers,tableWithCalls)
    local it = 1
    while it ~= 6 do
        if checkIfCalled(numbers[it],tableWithCalls) then -- if firstone is called check the next one
            it = it + 1
            if it == 6 then 
                return true 
            end  --if all 5 are  then return true
            -- else
            --     it = 6
            -- end
        end 
        return false
    end
end
    
function checkForVertical(bingoCard,tableWithCalls)
    for i = 1,5 do 
        local foo = {}
        for j = 1,5 do 
            foo[j] = bingoCard[j][i]
        end
        if checkNumbersForBingo(foo,tableWithCalls) then return true end
    end
    return false
end
    
function checkCardForBingo(bingoCard,tableWithCalls)
    if checkForHorizontal(bingoCard,tableWithCalls) or checkForVertical(bingoCard,tableWithCalls) then
        return true
    end
end


function unmarkedNumbers(winningBingo, winningCalls)
    local unmarkedNumbers = {}
    for line = 1,5 do 
        for number = 1,5 do
            local found = false
            for _,v in ipairs(winningCalls) do
                if winningBingo[line][number] == v then
                    found = true
                end
            end            
            if found == false then
                table.insert(unmarkedNumbers,winningBingo[line][number])
            end
        end
    end
    return unmarkedNumbers
end


    
function score(winningBingo,winningCalls)
    
    local sum = 0

    for i,v in pairs(unmarkedNumbers(winningBingo, winningCalls)) do
        sum = sum + v
    end
    
    return sum*42
    
end

function getWinningBingo()
    for i = 1,100 do
        local found, index, bingoCard = checkAllForBingos(getCalls(i))
        if found then
            local calls = getCalls(i)
            return index, bingoCard, calls
        end
    end
end



print("-=DECLERATIONS ENDED=-")




        
local WinningBingoNo, winningBingo, winningCalls =  getWinningBingo()

print(score(winningBingo, winningCalls))





print("-=END=-")













{ { 26, 89, 27, 47, 91 }, { 15, 9, 18, 62, 28 }, { 31, 96, 42, 81, 86 }, { 11, 52, 20, 93, 38 }, { 83, 64, 39, 1, 60 }, "" }

{ 13, 79, 74, 35, 76, 12, 43, 71, 87, 72, 23, 91, 31, 67, 58, 61, 96, 16, 81, 92, 41, 6, 32, 86, 77, 42 }