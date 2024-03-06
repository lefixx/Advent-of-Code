function lines_from(file) ---- get all lines from a file in the form of a table
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return lines
end


function printTable(table)
    for k,v in pairs(table) do
        print(k,v)
    end
end
local input = lines_from("puzzleinput")

local sum = 0
-- for k,line in pairs(input) do
--     local firstNumber = string.match(line, "%d") -- using pattern matching to get the first digit
--     local lastNumber = string.match(string.reverse(line), "%d") -- reversing the string before searching returns the last digit
--     sum = sum + (firstNumber..lastNumber)
-- end


local allPatterns = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine","1","2","3","4","5","6","7","8","9","0" }
local pattern = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}

reversePatterns = {}
for k,v in ipairs(allPatterns) do
    reversePatterns[k] = string.reverse(v)
end
solution = {}


for k,line in pairs(input) do
    for j,word in pairs(allPatterns) do
        for i = 1,string.len(line) do
            -- print("looking at ",line,"for: ", word, "at :",i)
            if string.find(line, word) then
                if string.find(line, word) == i then
                    if word == "one" then word = 1 end
                    if word == "two" then word = 2 end
                    if word == "three" then word = 3 end
                    if word == "four" then word = 4 end
                    if word == "five" then word = 5 end
                    if word == "six" then word = 6 end
                    if word == "seven" then word = 7 end
                    if word == "eight" then word = 8 end
                    if word == "nine" then word = 9 end
                    table.insert(solution,{line,word})
                end
            end
            break -- stops looking after finding the first match
        end
    end
end


for k,line in pairs(input) do
    for j,word in pairs(allPatterns) do
        line = string.reverse(line)
        word = string.reverse(word)
        for i = 1,string.len(line) do
            -- print("looking at ",line,"for: ", word, "at :",i)
            if string.find(line, word) then
                if string.find(line, word) == i then
                    -- print(line, word,i)
                    if word == "eno" then word = 1 end
                    if word == "owt" then word = 2 end
                    if word == "eerht" then word = 3 end
                    if word == "ruof" then word = 4 end
                    if word == "evif" then word = 5 end
                    if word == "xis" then word = 6 end
                    if word == "neves" then word =7  end
                    if word == "thgie" then word = 8 end
                    if word == "enin" then word = 9 end
                    print(line,word)
                    print(solution[k][1])
                    print(solution[k][2])
                    solution[k][3] = word
                end
            end
            break -- stops looking after finding the first match
        end
    end
end

--108239 too high
--53789 too low
-- for k,v in pairs(solution) do
--     printTable(v)
-- end
-- print(sum)