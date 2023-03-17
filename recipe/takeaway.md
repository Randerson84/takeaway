1. Describe the Problem
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the Class System
Design the interfaces of each of your classes and how they will work together to achieve the job of the program. You can use diagrams to visualise the relationships between classes.

```ruby

class Orders
    def initialize()
        @customer_order = []
    end
    def get_customer_order(order)
        @customer_order << order
    end
    def receipt()
        #takes in the customer order/menu and outputs an itemized receipt
        # checks the dish name and then multiplies the price from the menu by the quantity on the customer order
    end
    def confirmation()
        #sends a confirmation text to the customer
    end
end
class Menu
    def initialize
        @menu = [{"Chicken Fried Rice" => 7}, {"Boiled Rice" => 2}, {"Fried Rice" => 2.50}]
    end
    def read_menu()
        return @menu
    end
end
class CustomerOrder
    def initialize()
        @order = {}     
    end
    def order_item
        do while order_finished == false
            get dish_name for item to order
            get quantity
            @order << {"Chicken Fried Rice" => 1}
            get order more? if "No" ? order_finished = true : order_finished = false
        end
    end
end

```

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# Do the below for 1 order

# create receipt
it "give a receipt" do
    orders = Orders.new
    menu_obj = Menu.new
    menu = menu_obj.read_menu
    customer_order = CustomerOrder.new(Kernel)
    order = customer_order.order_item
    expect(orders.receipt(order, menu)).to eq "1 - Fried Rice - £2.50 \nTotal = £2.50"
end
it "give a receipt for multiple items" do
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
end #only way to test the text is to actually receive it

# send confirmation


Encode one of these as a test and move to step 4.

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# Orders class unit tests
# create Orders
orders = Orders.new

# create receipt

# send confirmation text
it 'Confirmation method test' do
    twilio_mock = double :fake_twilio
    messages_mock = double :messages
    expect(messages_mock).to receive(:create).with({body: "Thank you! Your order was placed and will be delivered before 18:52", :from=>'+15075854185', :to=>'+447873206027'})
    client_mock = double :fake_client, messages: messages_mock
    expect(twilio_mock).to receive(:new).and_return(client_mock)
    orders = Orders.new
    orders.confirmation(twilio_mock)
 end
# Menu class unit tests

# Read the menu
    menu = Menu.new
    menu.read_menu
    expect menu

# CustomerOrder class unti tests

# add an order
    io = double :io
    expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
    expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
    expect(io).to receive(:gets).and_return("Chicken Fried Rice").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
     expect(io).to receive(:gets).and_return("No").ordered
    cust_order = CustomerOrder.new(io)
    customer_order.order_item
    expect(customer_order.order_item).to eq [{"Chicken Fried Rice"=>1}]
# add multiple items
    io = double :io
    expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
    expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
    expect(io).to receive(:gets).and_return("Boiled Rice").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
    xpect(io).to receive(:gets).and_return("Yes").ordered
    expect(io).to receive(:puts).with("Hello. Welcome to the takeaway.").ordered
    expect(io).to receive(:puts).with("Please enter a dish name to order").ordered
    expect(io).to receive(:gets).and_return("Chicken Fried Rice").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of that dish to order").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("Would you like to order another dish?").ordered
    expect(io).to receive(:gets).and_return("No").ordered
    customer_order = CustomerOrder.new(io)
    customer_order.order_item
    expect(customer_order.order_item).to eq [{"Boiled Rice"=>2}, {"Chicken Fried Rice"=>1}]

Encode one of these as a test and move to step 5.

5. Implement the Behaviour
...