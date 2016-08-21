class PasswordChecker
    attr_writer :validators

    def initialize
        @validators = [
            'longer_than_seven_characters',
            'must_contain_at_least_one_digit',
            'must_contain_at_least_one_symbol',
            'must_contain_at_least_one_lowercase',
            'must_contain_at_least_one_uppercase',
            'must_not_contain_neither_name_nor_domain'
        ]
    end

    def check_password email, password
        return false if email.nil? ||
                        password.nil? ||
                        email.empty? ||
                        password.empty? ||
                        @validators.empty?
        @email, @password = email, password
        @validators.all? do |method|
            method = method.to_sym
            self.public_send method if self.methods.include? method
        end
    end

    def longer_than_seven_characters
        /.{8,}/ === @password
    end

    def must_contain_at_least_one_letter
        /(?=.*[[:alpha:]])/ === @password
    end

    def must_contain_at_least_one_digit
        /(?=.*[[:digit:]])/ === @password
    end

    def must_contain_at_least_one_symbol
        /(?=.*[!@\#$&*])/ === @password
    end


    def must_contain_at_least_one_lowercase
        /(?=.*[[:lower:]])/ === @password
    end

    def must_contain_at_least_one_uppercase
        /(?=.*[[:upper:]])/ === @password
    end

    def user_and_domain
        user, domain = @email.gsub(/(.+)@.+/, '\1'), @email.gsub(/.+@([^.]+).+/, '\1')
    end

    def must_not_contain_neither_name_nor_domain
        user, domain = user_and_domain
        !(Regexp.new("#{user}|#{domain}") === @password)
    end
end