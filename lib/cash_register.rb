require 'pry'
class CashRegister
attr_accessor :total #:discount


    def initialize(employee_discount = 0)
        @total = 0
        @employee_discount = employee_discount
        @cart = []
    end

def discount
    if @employee_discount > 0 
        @employee_discount = 20
    else
        @employee_discount = 0
    end
end

def add_item(title, price, quantity=1)
    if title && price && quantity
        @total += price * quantity
    end
    @cart << [title, price, quantity]
end

def apply_discount
    if @employee_discount > 0
        
        @total = @total - (@total * discount/100)
        "After the discount, the total comes to $#{@total}."
    else
        "There is no discount to apply."
    end
end


    def items
        output = []
        @cart.each do |item| 
        
            item[2].times do 
                output << item[0]
            end

        end
        output
    end


def void_last_transaction
    void = @cart.pop
    @total -= void[1] * void[2]
end

end
