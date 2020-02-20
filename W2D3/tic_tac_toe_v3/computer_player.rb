class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark_val)
        @mark = mark_val
    end

    def get_position(legal_pos)
        legal_pos[rand(0...legal_pos.length)]
    end
end