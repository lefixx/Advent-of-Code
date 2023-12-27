function lines_from(file) ---- get all lines from a file, returns nil if the file does not exist
    if not file_exists(file) then return nil end
    local lines = {}
    for line in io.lines(file) do
        lines[#line+1] = line
    end
    return lines
end
