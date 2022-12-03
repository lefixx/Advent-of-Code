 -- HELPER FUNCTIONS
function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

 -- BINGO FUNCTIONS
function allBingoes()
    file = io.open("E:/[Code]/AdventofCode/Advent-of-Code/Day4/Bingo Cards.txt","r")
    io.input(file)
    local x = io.input().read(file,"a")

    local count = 0

    local numbers = {}
    for i in string.gmatch(x,"%d+") do
        table.insert(numbers,i+0)
    end


    local bingoCardLines = {}
    for i = 1,500 do
        bingoCardLines[i] = {}
        for j = 1,5 do
            bingoCardLines[i][j] = numbers[j+(i*5-5)]
        end
    end

    local bingoCards = {}
    for i = 1, 100 do
        bingoCards[i] = {}
        for j = 1,5 do
            bingoCards[i][j] = bingoCardLines[j+(i*5-5)]
        end
    end
    return bingoCards
end

function allCallouts()
    file = io.open("E:/[Code]/AdventofCode/Advent-of-Code/Day4/callouts.txt","r")
    io.input(file)
    local x = io.input().read(file,"a")

    local callouts = {}
    for i in string.gmatch(x,"%d+") do
        table.insert(callouts,i+0)
    end
    return callouts
end

function callouts(round)
    local allCallouts = allCallouts()
    local callouts = {}
    for i = 1,round do
        callouts[i] = allCallouts[i]
    end
    return callouts
end

function checkForBingo(bingoCards, round)

    for i,bingoCard in ipairs(bingoCards) do
        if checkBingoCard(bingoCard,round) then
            return true, i, bingoCard
        end
    end

    return false
end

function checkNumbersForBingo(numbers, callouts)
    local progress = 0
    for _,v in ipairs(numbers)  do
        for __,m in pairs(callouts) do
            if v == m then
                progress = progress + 1
            end
        end
    end
    if progress == 5 then return true end
    return false
end

function checkBingoCard(bingoCard,round)
    local callouts = callouts(round)
    for i = 1,5 do
        if checkNumbersForBingo(bingoCard[i],callouts) then 
            return true, bingoCard, round
        end
    end

    local foo = {}
    for j = 1,5 do
        for i = 1,5 do
            if j == i then 
                foo[i] = i
            end
        end
    end
    if checkNumbersForBingo(foo,callouts) then
        return true, bingoCard, round
    end
    return false
end

function getFirstWinningBingo() -- returns the bingo card that will win first
                                -- returns boolean, index, card, round
    local allBingoes = allBingoes()
    local allCallouts = allCallouts()
    local round = 5
    local done = false
    local someoneWon = false

    while not done do 
        local someoneWon, winIndex, winningBingoCard = checkForBingo(allBingoes,round)
        if someoneWon then 
            return someoneWon, winIndex, winningBingoCard, round+1
        end
        if round == 100 or someoneWon then done = true end
        round = round +1
    end
    return "noonewon"
end

function getFirstWinningBingo2(cards) -- returns the bingo card that will win first
                                -- returns boolean, index, card, round
    local allBingoes = cards
    local allCallouts = allCallouts()
    local round = 5
    local someoneWon = false

    while someoneWon == false do 
        local someoneWon, winIndex, winningBingoCard = checkForBingo(allBingoes,round)
        if someoneWon then 
            return someoneWon, winIndex, winningBingoCard, round+1
        end
        round = round +1
    end
    return "noonewon"
end

function score(x,y) -- returns the score of a bingo card, needs to know what round
    print("here")
    local card = x
    local callouts = callouts(y)
    for i = 1,5 do
        for j = 1,5 do
            for _,v in ipairs(callouts) do
                if card[i][j] == v then 
                    card [i][j] = 0
                end
            end
        end
    end
    local sum = 0
    for i = 1,5 do
        for j = 1,5 do
            sum = sum + card[i][j]
        end
    end
    return sum*callouts[#callouts]
end

-- function removeBingoCard(cards, index) --returns bingo cards without the indexed one

--     table.remove(cards, index)

-- end
    

function removeFirstWinningBingoCard(cards) --find what bingo card will win first and removes it from game

    local a, index, card, round = getFirstWinningBingo()

    local restOfCards = removeBingoCard(cards,index)

    return restOfCards
end





sample = {
    {11,12,13,14,15},
    {21,22,23,24,25},
    {31,32,33,34,35},
    {41,42,43,44,45},
    {51,52,53,54,55}
}


-- print(getFirstWinningBingo())
someoneWon, winIndex, winningBingoCard, round = getFirstWinningBingo()

print"here"



print(score(winningBingoCard,round))


print"here"












score(winningBingoCard,round)print("here")


