require "menu"

RSpec.describe Menu do
    context "Unit tests for the Menu class" do
        it "read the menu" do
            menu = Menu.new
            expect(menu.read_menu).to eq [{"Dish" => "Chicken Fried Rice", "Price" => "%.2f" %7.00}, {"Dish" => "Fried Rice", "Price" => "%.2f" %2.50}, {"Dish" => "Boiled Rice", "Price" => "%.2f" %2.00}]
        end
    end
end
