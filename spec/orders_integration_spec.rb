require "orders"
require "menu"
require "customer_order"

RSpec.describe Orders do
    context "Integration tests" do
        xit "give a receipt" do
            orders = Orders.new
            menu_obj = Menu.new
            menu = menu_obj.read_menu
            customer_order = CustomerOrder.new(Kernel)
            order = customer_order.order_item
            expect(orders.receipt(order, menu)).to eq "1 - Fried Rice - £2.50 \nTotal = £2.50"
        end
        xit "give a receipt for multiple items" do
            orders = Orders.new
            menu_obj = Menu.new
            menu = menu_obj.read_menu
            customer_order = CustomerOrder.new(Kernel)
            order = customer_order.order_item
            expect(orders.receipt(order, menu)).to eq "1 - Fried Rice - £2.50 \n1 - Boiled Rice - £2.00 \nTotal = £4.50"
        end
        it "give a confirmation" do
            orders = Orders.new
            expect(orders.confirmation(Twilio::REST::Client)).to eq "Confirmation sent"
        end
        
    end
end