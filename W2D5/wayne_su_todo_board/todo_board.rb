require_relative "item"
require_relative "list"

class TodoBoard
    def initialize
        # @lists = Hash.new do |h, k|
        #     h[label] = List.new(label)
        # end
        @lists = {}
    end
    
    def get_command
    # def get_command(command, arguments = [])
        print "Enter a Command: "
        cmd, *args = gets.chomp.split(' ') # what is this
        # cmd = command
        # args = arguments
        
        case cmd
        when 'mklist'
            @lists[*args] = List.new(*args)
        when 'ls'
            print_lists #
        when 'mktodo'
            @lists[args.shift].add_item(*args)
        when 'up'
            listname = args.shift
            int_args = args.map(&:to_i)
            @lists[listname].up(*int_args)
        when 'down'
            listname = args.shift
            int_args = args.map(&:to_i)
            @lists[listname].down(*int_args)
        when 'swap'
            listname = args.shift
            int_args = args.map(&:to_i)
            @lists[listname].swap(*int_args)
        when 'toggle'
            listname = args.shift
            int_args = args.map(&:to_i)
            @lists[listname].toggle_item(*int_args)
        when 'rm'
            listname = args.shift
            int_args = args.map(&:to_i)
            @lists[listname].remove_item(*int_args)
        when 'sort'
            listname = args.shift
            @lists[listname].sort_by_date
        when 'purge'
            listname = args.shift
            @lists[listname].purge
        when 'priority'
            listname = args.shift
            @lists[listname].print_priority
        when 'print'
            listname = args.shift
            if args.length == 0
                @lists[listname].print
            else
                int_args = args.map(&:to_i)
                @lists[listname].print_full_item(*int_args)
            end
        when 'showall'
            showall
        when 'quit'
            return false
        else
            puts "Sorry, that command is not recognized."
        end
        true
    end

    def run
        while get_command
            
        end    
    end

    def print_lists
        @lists.each_key do |k|
            puts k
        end
        puts ''
    end
    
    def showall
        @lists.each do |k, v|
            @lists[k].print
            puts ""
        end
    end
end

# auto_run
my_board = TodoBoard.new
my_board.run

# my_board.get_command('mktodo', ['ruby', '2019-12-04'])
# my_board.get_command('mktodo', ['sql', '2019-12-20'])
# my_board.get_command('mktodo', ['rails', '2020-01-06'])
# my_board.get_command('mktodo', ['javascript', '2020-01-08'])
# my_board.get_command('mktodo', ['react', '2020-02-08'])
# my_board.get_command('mktodo', ['redux', '2020-02-15'])
# my_board.get_command('print')

# my_board.get_command('toggle', ['0'])
# my_board.get_command('print', ['0']) 

# my_board.get_command('toggle', ['0'])
# my_board.get_command('print')

# my_board.get_command('toggle', ['0'])
# my_board.get_command('toggle', ['2'])
# my_board.get_command('toggle', ['3'])
# my_board.get_command('print')

# my_board.get_command('rm', ['4'])
# my_board.get_command('print')

# my_board.get_command('purge')
# my_board.get_command('print')


#______________________________________________________________________________
# todo1 = TodoBoard.new("test")
# todo1.get_command

# mktodo cheese 2019-10-25 foooooood
# mktodo toothpaste 2019-10-23
# mktodo candy 2019-10-31 sugar-free
# mktodo shampoo 2019-10-25