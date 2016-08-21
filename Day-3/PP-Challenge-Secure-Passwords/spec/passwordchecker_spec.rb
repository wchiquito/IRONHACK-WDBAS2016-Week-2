RSpec.describe 'PasswordChecker test' do
    let (:passwordchecker) { PasswordChecker.new }

    it 'should be false if email and password are nil' do
        is_valid = passwordchecker.check_password nil, nil
        expect(is_valid).to eq false
    end

    it 'should be false if email is nil' do
        is_valid = passwordchecker.check_password nil, '12userT$LLL'
        expect(is_valid).to eq false
    end

    it 'should be false if password is nil' do
        is_valid = passwordchecker.check_password 'user@ironhack.com', nil
        expect(is_valid).to eq false
    end

    it 'should be false if email or password are empty' do
        is_valid = passwordchecker.check_password '', ''
        expect(is_valid).to eq false
    end

    it 'should be false if email is empty' do
        is_valid = passwordchecker.check_password '', '12userT$LLL'
        expect(is_valid).to eq false
    end

    it 'should be false if password is empty' do
        is_valid = passwordchecker.check_password 'user@ironhack.com', ''
        expect(is_valid).to eq false
    end

    it 'should be false if validators is empty array' do
        passwordchecker.validators = []
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12userT$LLL'
        expect(is_valid).to eq false
    end

    it 'should be false if password is not longer than 7 characters' do
        passwordchecker.validators = ['longer_than_seven_characters']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '1234567'
        expect(is_valid).to eq false
    end

    it 'should be true if password is longer than 7 characters' do
        passwordchecker.validators = ['longer_than_seven_characters']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12345678'
        expect(is_valid).to eq true
    end

    it 'should be false if password nt contain at least 1 letter' do
        passwordchecker.validators = ['must_contain_at_least_one_letter']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '@'
        expect(is_valid).to eq false
    end

    it 'should be true if password contain at least 1 letter' do
        passwordchecker.validators = ['must_contain_at_least_one_letter']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 'A'
        expect(is_valid).to eq true
    end

    it 'should be false if password not contain at least 1 number' do
        passwordchecker.validators = ['must_contain_at_least_one_digit']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 'd'
        expect(is_valid).to eq false
    end

    it 'should be true if password contain at least 1 number' do
        passwordchecker.validators = ['must_contain_at_least_one_digit']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '0'
        expect(is_valid).to eq true
    end

    it 'should be false if password contain at least 1 symbol' do
        passwordchecker.validators = ['must_contain_at_least_one_symbol']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '2'
        expect(is_valid).to eq false
    end

    it 'should be true if password contain at least 1 symbol' do
        passwordchecker.validators = ['must_contain_at_least_one_symbol']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '#'
        expect(is_valid).to eq true
    end

    it 'should be false if password not contain at least 1 uppercase' do
        passwordchecker.validators = ['must_contain_at_least_one_uppercase']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 't'
        expect(is_valid).to eq false
    end

    it 'should be true if password contain at least 1 uppercase' do
        passwordchecker.validators = ['must_contain_at_least_one_uppercase']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 'T'
        expect(is_valid).to eq true
    end

    it 'should be false if password not contain at least 1 lowercase' do
        passwordchecker.validators = ['must_contain_at_least_one_lowercase']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 'S'
        expect(is_valid).to eq false
    end

    it 'should be true if password contain at least 1 lowercase' do
        passwordchecker.validators = ['must_contain_at_least_one_lowercase']
        is_valid = passwordchecker.check_password 'user@ironhack.com', 's'
        expect(is_valid).to eq true
    end

    it 'should be false if contain neither the name nor the domain of the email' do
        passwordchecker.validators = ['must_not_contain_neither_name_nor_domain']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12userT$'
        expect(is_valid).to eq false
    end

    it 'should be true if not contain neither the name nor the domain of the email' do
        passwordchecker.validators = ['must_not_contain_neither_name_nor_domain']
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12usHer1r0nhack'
        expect(is_valid).to eq true
    end

    it 'should be false if not meet all validators' do
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12user1r0nhack'
        expect(is_valid).to eq false
    end

    it 'should be true if meet all validators' do
        is_valid = passwordchecker.check_password 'user@ironhack.com', '12us3r&1r0nHack'
        expect(is_valid).to eq true
    end
end