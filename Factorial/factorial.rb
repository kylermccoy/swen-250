# factorial(n) is defined as n*n-1*n-2..1 for n > 0
# factorial(n) is 1 for n=0
# Let's raise an exception if factorial is negative
# Let's raise an exception if factorial is anything but an integer

def factorial(n)
  # Write the factorial code here per the activity
  if n < 0
    raise RangeError
  end
  total = 1 
  while n > 0
    total *= n
    n -= 1
  end
  n = total
end
