function init_board()
  local bo = {}
  for i=1,9 do
    bo[i] = {}
    for j=1,9 do
      bo[i][j] = 0
    end
  end
  return bo
end

local function deep_copy(t)
  if type(t) ~= "table" then return t end
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = deep_copy(v)
  end
  return t2
end

function fill_board(b)
  local board = deep_copy(b)
  l_ops = {}
  l_ops_pos = {0, 0}
  for i=1,9 do
    for j=1,9 do
      if board[i][j] == 0
      then
        ops = {}
        for k=1,9 do
          board[i][j] = k
          if is_unique(board, i, j)
          then
            table.insert(ops, k)
          end
        end
        board[i][j] = 0
        if #ops ~= 0 and #ops < #l_ops or #l_ops == 0
        then
          l_ops = ops
          l_ops_pos = {i, j}
        end
      end
    end
  end
  if #l_ops ~= 0
  then
    board[l_ops_pos[1]][l_ops_pos[2]] = l_ops[math.random(#l_ops)]
    board = fill_board(board)
  end
  return board
end

function is_unique(board, x, y)
  unique = true
  for i=1,9 do
    -- vertical check
    if i~=x 
    and board[i][y] == board[x][y]
    then
      return false
    end
    -- horizontal check
    if i~=y 
    and board[x][i] == board[x][y]
    then
      return false
    end
  end
  -- check quadrant
  q_x = (x - 1) // 3 * 3
  q_y = (y - 1) // 3 * 3
  for j=1,3 do
    for k=1,3 do
      if x ~= q_x + j
      and y ~= q_y + k
      and board[q_x+j][q_y+k] == board[x][y]
      then
        return false
      end
    end
  end
  return unique
end

function print_board(bo)
  for i=1,9 do
    if i == 4 or i == 7
    then
      print("----------------")
    end
    local line = ""
    for j=1,9 do
      if j == 4 or j == 7
      then
        line = line .. " | "
      end
      line = line .. bo[i][j]
    end
    print(line)
  end
end

function no_zeros(bo)
  for i=1,9 do
    for j=1,9 do
      if bo[i][j] == 0
      then
        return false
      end
    end
  end
  return true
end

-- main
-- local ibo = init_board()
local ibo = {
  {0,0,6,0,0,0,0,0,8},
  {4,0,2,6,0,0,5,9,0},
  {0,0,5,7,0,4,0,0,0},
  {9,0,0,0,7,1,0,0,2},
  {6,0,7,0,2,0,1,0,4},
  {8,0,0,5,4,0,0,0,3},
  {0,0,0,1,0,8,4,0,0},
  {0,1,9,0,0,2,6,0,7},
  {2,0,0,0,0,0,3,0,0}
}

print("try solve sudoku")
print_board(ibo)

while true do
fbo = fill_board(ibo)
if no_zeros(fbo)
  then
  break
end
  print("\nfilled board wrongly, try again")
  print_board(fbo)
end

print("\nfound solution")
print_board(fbo)

local x = os.clock()
local s = 0
for i=1,100000 do s = s + i end
print(string.format("\nelapsed time: %.7f\n", os.clock() - x))
