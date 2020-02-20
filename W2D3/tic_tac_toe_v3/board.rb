class Board
    def initialize(n)
        @board = Array.new(n) { Array.new(n, '_') }
    end

    def valid?(pos)
        n = @board.length
        if pos[0] > (n - 1) || pos[1] > (n - 1) || pos[0] < 0 || pos[1] < 0
            false
        else
            true
        end
    end

    def empty?(pos)
        @board[pos[0]][pos[1]] == '_'
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            @board[pos[0]][pos[1]] = mark
        else
            raise "Cannot place mark there"
        end
    end

    def print
      @board.each do |row|
        puts row.join(' | ')
      end
    end

    def win_row?(mark)
      @board.any? { |row| row.all? { |ele| ele == mark } }
    end

    def win_col?(mark)
      @board.transpose.any? { |col| col.all? { |ele| ele == mark } }
    end

    def win_diagonal?(mark)
      n = @board.length
      back_dia = (0..n - 1).all? do |i|
        @board[i][i] == mark
      end

      forward_dia = (0..n - 1).all? do |i|
        @board[i][n - 1 - i] == mark
      end

      back_dia || forward_dia   
    end

    def win?(mark)
      win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
      @board.flatten.any? { |ele| ele == '_'}
    end

    def legal_positions
      legal_pos = []
      n = @board.length
      (0...n).each do |row_i|
        (0...n).each do |col_i|
          if valid?([row_i, col_i]) && empty?([row_i, col_i])
            legal_pos << [row_i, col_i]
          end
        end
      end
      legal_pos
    end
end