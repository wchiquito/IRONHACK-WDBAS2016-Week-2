class Lexiconomitron
    def eat_t text
        text.gsub /[tT]/, ''
    end

    def shazam arr
        [eat_t(arr.first.reverse!), eat_t(arr.last.reverse!)]
    end

    def oompa_loompa arr
        arr.select { |word| word.length <= 3 }.map! { |word| eat_t word }
    end
end

RSpec.describe Lexiconomitron do
    describe '#eat_t' do
        let (:lexi) { Lexiconomitron.new }

        it 'removes every letter t from the input' do
            expect(lexi.eat_t 'great scott!').to eq 'grea sco!'
        end

        it 'removes every letter t from the input (1)' do
            expect(lexi.eat_t 'scott! great').to eq 'sco! grea'
        end

        it 'removes every letter T from the input' do
            expect(lexi.eat_t 'SCOTT! GREAT').to eq 'SCO! GREA'
        end

        it 'removes every letter t from the input' do
            expect(lexi.shazam(['This', 'is', 'a', 'boring', 'test'])).to  eq(['sih','se'])
        end

        it 'removes every letter t from the input' do
            expect(lexi.shazam(['Today', 'is', 'a', 'great', 'day'])).to  eq(['yado','yad'])
        end

        it 'removes every letter t from the input' do
            expect(lexi.oompa_loompa(['if', 'you', 'wanna', 'be', 'my', 'lover'])).to  eq(['if','you','be','my'])
        end

        it 'removes every letter t from the input' do
            expect(lexi.oompa_loompa(['ift', 'yout', 'wannaT', 'be', 'myt', 'lovert'])).to  eq(['if','be','my'])
        end
    end
end
