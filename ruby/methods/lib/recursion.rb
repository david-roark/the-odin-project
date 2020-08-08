# SOLUTION ; takes a number and returns that many members of the fibonacci sequence

# Use; iteration
def fibs(n)
  arr = [0, 1]
  return arr[0..n] if n <= 1
  (2..n).each { |a| arr << arr[-2] + arr[-1] }
  arr
end
fibs(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# Use: recursively (less than 3 lines)
def fibs_rec(n)
  return [0,1][0..n] if n <= 1
  fibs_rec(n-1) << fibs_rec(n-1)[-1] + fibs_rec(n-1)[-2]
end
fibs_rec(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]