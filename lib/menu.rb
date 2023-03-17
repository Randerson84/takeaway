class Menu
    def initialize
        @menu =  [{"Dish" => "Chicken Fried Rice", "Price" => "%.2f" % 7.00}, {"Dish" => "Fried Rice", "Price" => "%.2f" % 2.50}, {"Dish" => "Boiled Rice", "Price" => "%.2f" %2.00}]
    end
    def read_menu
        return @menu
    end
end