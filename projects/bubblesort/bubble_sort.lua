function bubbleSort(arr)
    local array = arr
    local n = #array
    repeat
        print(
            "Array: ", table.concat(array,", "), 
            "Swap count: ", swapped
        )
        swapped = false
        for i=1,n do
            if i < n and array[i] > array[i+1] then
                array[i], array[i+1] = array[i+1], array[i]
                swapped = true
            end
        end
        n = n - 1
    until not swapped
    return arr
end


return {
    bubbleSort = bubbleSort
}