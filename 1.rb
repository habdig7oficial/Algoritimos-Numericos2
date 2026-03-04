=begin
    Exercício 1
=end

class Numeric

    # New number is O(N) complexity
    # Precalculated number is O(1)
    @@arr = []
    def fact(num)
        if num == 0
            return 1;
        elsif @@arr[num].nil?
            @@arr[num] =  num * fact(num - 1)
            return @@arr[num];
        else
            return @@arr[num];
        end
    end

    # If fact is already calculate this function is O(1)
    def calc(x, step)
        return (x ** step.to_f) / fact(step)
    end

    # Always O(N) external loop 
    def sum(limit, func, precision)
        sum = 0.0 
        i = 0
        while i < precision 
            sum += func.call(limit, i)
            i += 1
        end
        return sum
    end

    def exp(precision = 10)
        return self.sum(self, self.method(:calc), precision)
    end

end

=begin
    Exercício 2

    outer loop -> O(N)

    factorial -> first time = O(N) 
              -> other times = O(1) [because of memorization]

    calc func -> O(1) multiplication cost, since x ** y is native

    my implementation: 
    O(N) + O(N) * O(1) * O(1) = O(N)
    |      |        |       |
    |      |        |       |-> power and division
    |      |        |
    |      |        |-> Subsequent factorials
    |      |
    |      |-> First Factorial
    |
    |-> Outer loop sum

    naive implementation {if fact cost O(N) every time}:
    O(N) n * O(N) * O(1) * O(1) = O(N ** 2)
    
    
=end

=begin
    Exercício 3
=end

gabarit = Math.exp 3

p5 = 3.exp 5
err5 = gabarit - p5 
err_rel5 = err5 / gabarit

puts "Precision 5: #{p5}"
puts "Absolute Error #{err5}"
puts "Relative Error #{err_rel5}"


p10 = 3.exp 10
err10 = gabarit - p10
err_rel10 = err10 / gabarit

puts "\n\nPrecision 10: #{3.exp 10}"
puts "Absolute Error #{err10}"
puts "Relative Error #{err_rel10}"


=begin
    RESULTS:

    Precision 5: 16.375
    Absolute Error 3.710536923187668
    Relative Error 0.18473675547622795


    Precision 10: 20.063392857142855
    Absolute Error 0.022144066044813115

    Conclusion: 
    
    The aproximation with 10 decimal digits have a smaller error therfore it's more prescise
=end
