class FizzBuzz
	def print_fizzbuzz number
		fizzbuzz = divisible number, 3, 'Fizz'
		fizzbuzz += divisible number, 5, 'Buzz'
		fizzbuzz = number.to_s if fizzbuzz.empty?
		fizzbuzz
	end

	def divisible number, divisor, text
		return '' if not number.modulo(divisor) == 0
		text
	end

	def fizzbuzz
		@fizzbuzz = FizzBuzz.new
		(1..100).each do |number|
			puts @fizzbuzz.print_fizzbuzz number
		end
	end
end

RSpec.describe 'FizzBuzz Test' do
	let (:fizzbuzz) { FizzBuzz.new }
   
	it 'FizzBuzz exists' do
        expect(fizzbuzz).to be_an_instance_of FizzBuzz
    end

	it 'return Fizz if multiple 3' do
        expect(fizzbuzz.print_fizzbuzz 3).to eq 'Fizz'
    end

    it 'return Buzz if multiple 5' do
        expect(fizzbuzz.print_fizzbuzz 5).to eq 'Buzz'
    end

    it 'return FizzBuzz if multiple 3 or 5' do
        expect(fizzbuzz.print_fizzbuzz 15).to eq 'FizzBuzz'
    end

    it 'return 1 if not multiple 3 or 5' do
        expect(fizzbuzz.print_fizzbuzz 1).to eq '1'
    end

    it 'return 13 if not multiple 3 or 5' do
        expect(fizzbuzz.print_fizzbuzz 13).to eq '13'
    end

    it 'return 30 if not multiple 3 or 5' do
        expect(fizzbuzz.print_fizzbuzz 30).to eq 'FizzBuzz'
    end
end

(FizzBuzz.new).fizzbuzz