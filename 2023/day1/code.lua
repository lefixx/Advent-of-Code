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




--108239 too high
--53789 too low
print(sum)