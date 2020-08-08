
def merge_sort(arr)
  if arr.size >= 2
    x = arr.size/2 - 1
    arr_l = merge_sort(arr[0..x])
    arr_r = merge_sort(arr[x+1..-1])
    
    merged = []
    until arr_l == [] || arr_r == []
      arr_l[0] <= arr_r[0] ? merged << arr_l.shift : merged << arr_r.shift
    end
    return merged + arr_l + arr_r
  else
    return arr
  end  
end

merge_sort [1,4,-5,-41,10,6,-47,6]
# => [-47, -41, -5, 1, 4, 6, 6, 10]