
class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @item_prices = []
    end

    def add_item(item, price, quantitty = 1)
        @total += price * quantitty
        @items += [item] * quantitty
        @item_prices << price * quantitty
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
        @total -= @item_prices[-1]
        @item_prices = @item_prices.pop
        @items.length == 0 ? @total = 0.0 : nil
    end
end