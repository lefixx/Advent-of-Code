function lines_from(file) ---- get all lines from a file in the form of a table
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return lines
end

local input = lines_from("puzzleinput")

local sum = 0
for k,line in pairs(input) do
    local firstNumber = string.match(line, "%d") -- using pattern matching to get the first digit
    local lastNumber = string.match(string.reverse(line), "%d") -- reversing the string before searching returns the last digit
    sum = sum + (firstNumber..lastNumber)
end
print(sum)