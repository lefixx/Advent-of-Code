left = {}
right = {}

i=0
for line in io.lines("2024\\day 01\\puzzle") do   --for every line in the puzzle file
    i=i+1                                         --how else do you know what loop you are in?
    table.insert(left,i,tonumber(string.sub(line,1,5)))     --make a table with left numbers
    table.insert(right,i,tonumber(string.sub(line,7,13)))   --make a table with right numbers
end

table.sort(left)
table.sort(right)

local total = 0
for i,v in ipairs(right) do
    local dif = left[i]-right[i]   
    total = total + math.abs(dif)   --math.abs() returns absolute value
end

print(total)
print(1938424)



total = 0
for i,vl in ipairs(left) do
    local count = 0
    for j,vr in ipairs(right) do
        if vr == vl then 
            count = count +1
        end
    end    
    total = total + vl * count
end
print(total)
print(22014209)
