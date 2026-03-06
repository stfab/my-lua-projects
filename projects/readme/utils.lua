local utils = {}

-- list directories in a given path
function utils.list_directories(path)
    local directories = {}
    for entry in io.popen('ls -d ' .. path .. '/*/'):lines() do
        table.insert(directories, entry)
    end
    return directories
end

-- write a line to a file with standard \n\n at the end
function utils.write_line(file, line)
    file:write(line .. "\n\n")
end

return utils