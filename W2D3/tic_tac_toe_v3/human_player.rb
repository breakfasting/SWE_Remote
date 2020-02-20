class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_val)
        @mark = mark_val
    end

    def get_position(legal_pos)
        p 'Enter position:'
        pos_arr = gets.chomp.split.map(&:to_i)
        while !legal_pos.include?(pos_arr)
            puts "Error: Invalid choice! Enter another"
            pos_arr = gets.chomp.split.map(&:to_i)
        end
        pos_arr
    end

end