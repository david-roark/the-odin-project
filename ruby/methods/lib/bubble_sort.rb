def bubble_sort(arr)
  n = arr.size
  a = (1..n-1).to_a.reverse
  for i in a do
    for j in 0..i-1 do
      arr[j], arr[j+1] = arr[j+1], arr[j] if arr[j] >= arr[j+1]
    end
  end

  arr
end

p bubble_sort([1,42,1,2,1,2,5,14,35,25,2,11,-65,936,-1.6])
