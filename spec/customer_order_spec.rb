require "customer_order"

RSpec.describe CustomerOrder do
    context " CustomerOrder unit tests" do
        it "add order" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
            expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
            expect(io).to receive(:gets).and_return("Chicken Fried Rice").ordered
            expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
            expect(io).to receive(:gets).and_return("1").ordered
            expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
            expect(io).to receive(:gets).and_return("No").ordered
            customer_order = CustomerOrder.new(io)
            customer_order.order_item
            expect(customer_order.order_item).to eq [{"Dish" => "Chicken Fried Rice", "Quantity" => 1}]
        end
        it "add multiple items to order" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
            expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
            expect(io).to receive(:gets).and_return("Boiled Rice").ordered
            expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
            expect(io).to receive(:gets).and_return("2").ordered
            expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
            expect(io).to receive(:gets).and_return("Yes").ordered
            expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
            expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
            expect(io).to receive(:gets).and_return("Chicken Fried Rice").ordered
            expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
            expect(io).to receive(:gets).and_return("1").ordered
            expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
            expect(io).to receive(:gets).and_return("No").ordered
            customer_order = CustomerOrder.new(io)
            customer_order.order_item
            expect(customer_order.order_item).to eq [{"Dish" => "Boiled Rice", "Quantity"=>2}, {"Dish" => "Chicken Fried Rice", "Quantity" => 1}]
        end
    end
end
