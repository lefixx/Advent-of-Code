local caloricCount = 0
local caloriesPerSack = {}


for line in io.lines("E:/[Code]/AdventofCode/Advent-of-Code/2022/Day 1/input.txt") do
    if line == "" then 
        table.insert(caloriesPerSack,caloricCount)
        caloricCount = 0
    else 
        caloricCount = caloricCount + line
    end
end

table.sort(caloriesPerSack, function(a,b) return a > b end)
print(caloriesPerSack[1])
print(caloriesPerSack[1]+caloriesPerSack[2]+caloriesPerSack[3])