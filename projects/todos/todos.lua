local todos = {}
local todoFile = "todos.txt"

local function loadTodos()
    local file = io.open(todoFile, "r")
    if file then
        for line in file:lines() do
            table.insert(todos, line)
        end
        file:close()
    end
end

local function saveTodos()
    local file = io.open(todoFile, "w")
    if file then
        for _, todo in ipairs(todos) do
            file:write(todo .. "\n")
        end
        file:close()
    end
end

local function addTodo(todo)
    table.insert(todos, todo)
    saveTodos()
    print("Todo added successfully!")
end

local function listTodos()
    if #todos == 0 then
        print("No todos found.")
    else
        print("Todos:")
        for i, todo in ipairs(todos) do
            print(i .. ". " .. todo)
        end
    end
end

local function deleteTodo(index)
    if index < 1 or index > #todos then
        print("Invalid todo index.")
    else
        table.remove(todos, index)
        saveTodos()
        print("Todo deleted successfully!")
    end
end

local function main()
    loadTodos()

    while true do
        print("\nTodo Manager")
        print("1. Add Todo")
        print("2. List Todos")
        print("3. Delete Todo")
        print("4. Exit")
        print("Enter your choice:")

        local choice = io.read("*n")
        io.read() -- Consume the newline character

        if choice == 1 then
            print("Enter the todo:")
            local todo = io.read("*l")
            addTodo(todo)
        elseif choice == 2 then
            listTodos()
        elseif choice == 3 then
            print("Enter the todo index to delete:")
            local index = io.read("*n")
            deleteTodo(index)
        elseif choice == 4 then
            print("Goodbye!")
            break
        else
            print("Invalid choice. Please try again.")
        end
    end
end

-- Start the program
main()