print("-=START=-")

sampleBingoCard = {
    {14,86,50,89,49},
    {14,86,50,89,49},
    {14,86,50,89,49},
    {14,86,50,89,49},
    {14,13,50,13,13}
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
    
    
    -- while not done do 
    --     local bingo = {}
    --     for i = 1,6 do 
    --         local contents = io.input().read(file,"l")  -- get a line 
    --         if contents ~= "end" then
    --             if i ~= 6 then
    --                 if contents then 
    --                     contents = splitLinesToTable(contents)   -- split that line
    --                 else done = true 
    --                 end
    --                 bingo[i] = contents   --add line to bingo 
    --             end
    --         end
    --     end
            
    --     allBingos[it] = bingo
    --     it = it + 1

    -- end
    -- return allBingos
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
    for k,v in ipairs(allBingoes) do
        if checkForBingo(v,tableWithCalls) then return true,k,v end
    end
    return false
end

function checkForBingo(bingoCard,tableWithCalls)
    if checkForHorizontal(bingoCard,tableWithCalls) or checkForVertical(bingoCard,tableWithCalls) then
        return true
    end
end

-- function checkForVertical(bingoCard,tableWithCalls)
--     local bingoProgress = 0
--     local previousNumberColumn = nil
--     local previousNumberLine = nil



--     for column = 1,5 do
--         for line = 1,5 do
--             for something,calledNumber in pairs(tableWithCalls) do
--                 if bingoCard[line][column] == calledNumber then
--                     if previousNumberColumn == nil or previousNumberColumn == column then
--                         if previousNumberLine == nil or previousNumberLine == line then
--                             bingoProgress = bingoProgress + 1
--                             if bingoProgress == 2 then
--                                 print("asdf")
--                             end
--                             if bingoProgress == 5 then
--                                 return true
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end
--     return false
-- end

function checkForVertical(bingoCard,tableWithCalls)
    local foo = {}
    for i = 1,5 do 
        for j = 1,5 do 
            foo[i] = bingoCard[i][j]
        end
    end
    checkForBingo(foo,tableWithCalls)
end

function checkForBingo(numbers,tableWithCalls)
    local it = 1
    while it ~= 6 do
        if checkIfCalled(numbers[it],tableWithCalls) then -- if firstone is called check the next one
            it = it + 1
            if it == 6 then return true end  --if all 5 are  then return true
        else
            it = 6
        end
    end 
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

print("-=DECLERATIONS ENDED=-")


allBingoes = getAllBingos()

for i = 1,100 do
    local found, index, bingoCard = checkAllForBingos(getCalls(i))
    if found then
        print(found, index, bingoCard)
        break
    end
end

print("-=END=-")