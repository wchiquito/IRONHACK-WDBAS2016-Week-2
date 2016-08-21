class StringCalculator
    def parse_input input, delimiter = /[\s+,]+/
        input.strip!
        input.split delimiter
    end

    def add input
        (parse_input input).reduce(0) do |sum, current|
            sum + current.to_i
        end
    end
end

RSpec.describe 'String Calculator Test' do
    it 'zero length' do
        expect(StringCalculator.new.add '').to eq 0
    end

    it 'string withspaces' do
        expect(StringCalculator.new.add '   ').to eq 0
    end

    it 'string length one' do
        expect(StringCalculator.new.add '1').to eq 1
    end

    it 'strings numbers separated by spaces' do
        expect(StringCalculator.new.add '1 2 3').to eq 6
    end

    it 'string comma' do
        expect(StringCalculator.new.add ',,,').to eq 0
    end

    it 'strings numbers separated by comma' do
        expect(StringCalculator.new.add '4,5,6').to eq 15
    end

    it 'strings numbers separated by spaces and comma' do
        expect(StringCalculator.new.add '     7, 8 , 9 ').to eq 24
    end
end