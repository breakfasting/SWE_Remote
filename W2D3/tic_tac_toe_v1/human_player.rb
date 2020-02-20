class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_val)
        @mark = mark_val
    end

    def get_position
        p 'Enter position:'
        pos_arr = gets.chomp.split.map(&:to_i)
        if pos_arr.length != 2 
            raise "Error: Wrong format!"
        end
        pos_arr
    end

end