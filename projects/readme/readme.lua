local utils = require("utils")

local projects_dir = "../"
local prototypes_dir = projects_dir .. "/prototypes"

local all_projects = utils.list_directories(projects_dir)


local non_prototype_projects = {}
for _, project in ipairs(all_projects) do
    if project ~= prototypes_dir .. "/" then
        local project_name = string.gsub(project, "^..//", "")
        table.insert(non_prototype_projects, project_name)
    end
end


local readme_content = "## Projects\n\n"
for _, project in ipairs(non_prototype_projects) do
    local readme_file_path = projects_dir .. project .. "/README.md"
    local readme_file = io.open(readme_file_path, "r")
    local description = ""
    if readme_file then
        description = readme_file:read("*l")
        readme_file:close()
    end
    local project_link = "[" .. project .. "]" .. "(https://github.com/stfab/my-lua-projects/tree/main/projects/" .. project .. ")"
    readme_content = readme_content .. "- " .. project_link .. " " .. description .. "\n"
end

-- write README 
local readme_file = io.open("../" .. projects_dir .. "README.md", "w")

utils.write_line(readme_file, "# My Lua Projects")
utils.write_line(readme_file, "A repository with all kinds of Lua projects I develop. Including a dev environment.")
utils.write_line(readme_file, readme_content)
readme_file:close()


print("README.md has been generated successfully.")