class CashRegister

    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times do
            self.items << item
        end
        # ^or quantity.times {self.items << item}
        @total += price * quantity
        @last_transaction_amount = price * quantity
    end
    
    def apply_discount
        if  discount > 0
            @total -= @total * (@discount / 100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            @total -= @total * (@discount / 100.0)
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction_amount
        @last_transaction_amount = 0
    end
end
