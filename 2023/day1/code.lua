function lines_from(file) ---- get all lines from a file
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return lines
end

-- local foo = io.open("puzzleinput","r")
local input = lines_from("puzzleinput")


print(input[2])