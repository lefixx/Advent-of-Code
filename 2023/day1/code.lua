function lines_from(file) ---- get all lines from a file in the form of a table
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return lines
end

local input = lines_from("puzzleinput")

local sum = 0
-- for k,line in pairs(input) do
--     local firstNumber = string.match(line, "%d") -- using pattern matching to get the first digit
--     local lastNumber = string.match(string.reverse(line), "%d") -- reversing the string before searching returns the last digit
--     sum = sum + (firstNumber..lastNumber)
-- end


for k,line in pairs(input) do

    local foo = ""
    foo = string.find(line, "one")
    print(line, string.match(line, "(one)(two)(three)(four)(five)(six)(seven)(eight)(nine)"))
    print(line, string.match(line, "(one)(two)"))





    line = string.gsub(line,"one","1")
    line = string.gsub(line,"two","2")
    line = string.gsub(line,"three","3")
    line = string.gsub(line,"four","4")
    line = string.gsub(line,"five","5")
    line = string.gsub(line,"six","6")
    line = string.gsub(line,"seven","7")
    line = string.gsub(line,"eight","8")
    line = string.gsub(line,"nine","9")
    local firstNumber = string.match(line, "%d") -- using pattern matching to get the first digit
    local lastNumber = string.match(string.reverse(line), "%d") -- reversing the string before searching returns the last digit
    -- print(line,firstNumber, lastNumber, "\n")
    sum = sum + (firstNumber..lastNumber)
end
--108239 too high
--53789 too low
print(sum)