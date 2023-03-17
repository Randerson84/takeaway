require "orders"

RSpec.describe Orders do
    context "Orders unit tests" do
        it 'Confirmation method test' do
            twilio_mock = double :fake_twilio
            messages_mock = double :messages
            expect(messages_mock).to receive(:create).with({body: "Thank you! Your order was placed and will be delivered before 18:52", :from=>'+15075854185', :to=>'+447873206027'})
            client_mock = double :fake_client, messages: messages_mock
            expect(twilio_mock).to receive(:new).and_return(client_mock)
            orders = Orders.new
            orders.confirmation(twilio_mock)
        end
    end
end