
class Phone
    attr_reader :number

    def initialize(number)
        @number = number
    end

    def number
      error = Array.new(10, 0).join("")
      if (@number.length == 11) && (@number[0].to_i == 1)
        @number.slice!(0)
        @number
      elsif (@number.length == 11) && (@number[0].to_i != 1)
        @number.slice!(0)
        error = @number.gsub(/[0-9]/,'0')
      elsif @number.length <= 9
        error
      else @number.gsub(/[^0-9]/,'')
      end
    end

    def area_code
      @number.split("").values_at(0,1,2).join("")
    end

    def to_s
      if (@number.length == 10) && (@number =~ /(\d{3})(\d{3})(\d{4})$/)
        return "(#{$1}) #{$2}-#{$3}"
      elsif (@number.length == 11) && (@number =~ /(\d{3})(\d{3})(\d{4})$/)
        return @number.slice!(0) && "(#{$1}) #{$2}-#{$3}"
      end
    end

end
