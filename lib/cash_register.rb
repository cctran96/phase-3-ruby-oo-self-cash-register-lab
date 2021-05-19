
class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @last_item = 0
    end

    def add_item(item, price, quantitty = 1)
        @total += price * quantitty
        @items += [item] * quantitty
        @last_item = price * quantitty
    end

    def apply_discount
        if !@discount
            return "There is no discount to apply."
        end
        @total *= (1 - @discount/100.0)
        "After the discount, the total comes to $#{@total.to_i}."
    end

    def void_last_transaction
        @items = @items.pop
        @total -= @last_item
        @items.length == 0 ? @total = 0.0 : nil
    end
end