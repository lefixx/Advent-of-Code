local file = io.open('./input.txt')
local contents = file:read("a")
file:close()

local block = {}
for lines in contents:gmatch('[^\r\n]+') do
    local row = {}
    for count=1,#lines do
        table.insert(row, tonumber(lines:sub(count, count)))
    end
    table.insert(block, row)
end

-- risk level = 1+height
-- different cases for :-
--
-- corners of the block
-- numbers at the top and last row
-- numbers at the edges

-- check if its a corner, or edge

local result = {}
-- loop through all the rows
for rc=1,#block do
    -- loop through all the cols
    for cc=1,#block[rc] do
        if block[rc][cc] < 9 then

                local pos = {
                    up = block[rc-1] and block[rc-1][cc] or nil,
                    down = block[rc+1] and block[rc+1][cc] or nil,
                    right = block[rc][cc+1] and block[rc][cc+1] or nil,
                    left = block[rc][cc-1] and block[rc][cc-1] or nil,
                    current = block[rc][cc]
                }

                local currentCluster = {} 
                for k,v in pairs(pos) do
                    table.insert(currentCluster, v)
                end

                if math.min(table.unpack(currentCluster)) == block[rc][cc] then
                    table.insert(result, block[rc][cc])
                end
            end
        end
    end
                

local totalRisk = 0
for _,nums in pairs(result) do
    totalRisk = totalRisk + nums + 1
end

local msg = 'The risk level is '..totalRisk
print(msg)
