class Calculator
    def self.parse_number number
        number.to_i
    end

    def self.add first_number, second_number
        parse_number(first_number) + parse_number(second_number)
    end

    def self.substract first_number, second_number
        parse_number(first_number) - parse_number(second_number)
    end

    def self.multiply first_number, second_number
        parse_number(first_number) * parse_number(second_number)
    end

    def self.divide first_number, second_number
        second_number = parse_number(second_number)
        parse_number(first_number) / second_number if second_number != 0
    end
end