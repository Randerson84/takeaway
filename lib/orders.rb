require 'twilio-ruby'
require 'dotenv/load'

class Orders
    def initialize
        @orders = []
    end
    def receipt(customer_order, menu)
        receipt = String.new
        @total = 0.00
        customer_order.each do |dish|
            menu.each do |price|
                if price["Dish"] == dish["Dish"]
                    @dish_price = (dish["Quantity"].to_i * price["Price"].to_f)
                end
            end
            receipt << "#{dish["Quantity"]} - #{dish["Dish"]} - £#{"%.2f" % @dish_price} \n"
            @total = @total + @dish_price
        end
        receipt << "Total = £#{"%.2f" % @total}"
        return receipt
    end
    def confirmation(twilio_client)
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        client = twilio_client.new(account_sid, auth_token)

        from = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number
        to = ENV['MY_PHONE_NUMBER'] # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Thank you! Your order was placed and will be delivered before 18:52"
        )
        return "Confirmation sent"
    end
end