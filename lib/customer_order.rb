class CustomerOrder
    def initialize(io)
        @io = io
        @customer_order = []
        @another_dish = "Yes"
    end
    def order_item
        while @another_dish == "Yes" do
            @io.puts "Hello. Welcome to the takeaway."
            @io.puts "Please enter a dish name to order"
            dish = @io.gets.chomp 
            @io.puts "Please enter the quantity of that dish to order" 
            quantity = @io.gets.to_i
            @io.puts "Would you like to order another dish?"
            @another_dish = @io.gets.chomp
            order = {dish => quantity}
            @customer_order << order
        end
        return @customer_order
    end
end