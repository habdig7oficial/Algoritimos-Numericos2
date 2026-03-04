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


