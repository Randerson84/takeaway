require "menu"

RSpec.describe Menu do
    context "Unit tests for the Menu class" do
        it "create the menu" do
            menu = Menu.new
            expect(menu).to eq menu
        end
        it "read the menu" do
            menu = Menu.new
            expect(menu.read_menu).to eq [{"Chicken Fried Rice" => 7}, {"Boiled Rice" => 2}, {"Fried Rice" => 2.50}]
        end
    end
end
