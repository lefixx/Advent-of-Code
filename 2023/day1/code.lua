function lines_from(file) ---- get all lines from a file
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return lines
end

local input = lines_from("puzzleinput")

for k,line in pairs(input) do
    local firstNumber = string.match(line, "%d")
    local lastNumber = string.match(string.reverse(line), "%d")
    print(line, firstNumber, lastNumber)
end