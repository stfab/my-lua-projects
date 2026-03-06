local bubbleSort = require('bubble_sort').bubbleSort

-- verify the correctness of bubbleSort
function testBubbleSort()
    -- case 1: Already sorted array
    local arr1 = {1, 2, 3, 4, 5}
    local sortedArr1 = bubbleSort(arr1)
    for i, v in ipairs(sortedArr1) do
        assert(v == i, "Test case 1 failed: " .. v .. " should be " .. i)
    end
    print("Test case 1 passed!")

    -- case 2: Reverse sorted array
    local arr2 = {5, 4, 3, 2, 1}
    local sortedArr2 = bubbleSort(arr2)
    for i, v in ipairs(sortedArr2) do
        assert(v == i, "Test case 2 failed: " .. v .. " should be " .. i)
    end
    print("Test case 2 passed!")

    -- case 3: Random array
    local arr3 = {5, 3, 8, 4, 2}
    local sortedArr3 = bubbleSort(arr3)
    local expectedArr3 = {2, 3, 4, 5, 8}
    for i, v in ipairs(sortedArr3) do
        assert(v == expectedArr3[i], "Test case 3 failed: " .. v .. " should be " .. expectedArr3[i])
    end
    print("Test case 3 passed!")

    -- case 4: Array with duplicate elements
    local arr4 = {3, 1, 4, 1, 5, 9, 2, 6, 5}
    local sortedArr4 = bubbleSort(arr4)
    for i = 1, #sortedArr4 - 1 do
        assert(sortedArr4[i] <= sortedArr4[i + 1], "Test case 4 failed: Array is not sorted")
    end
    print("Test case 4 passed!")
end

testBubbleSort()