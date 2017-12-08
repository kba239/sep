def fib(n)
  fib_0 = 0
  fib_1 = 1
  if n < 2
    n
  else
    for n in 1..n-1 do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
    end
    fib_1
  end
end

puts fib(20)
