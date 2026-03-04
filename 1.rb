=begin
    Exercício 1
=end

class Numeric
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

    def calc(x, step)
        return (x ** step.to_f) / fact(step)
    end

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
=end
