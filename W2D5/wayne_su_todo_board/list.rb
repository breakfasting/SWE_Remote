require_relative "item"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx) # 1, 7
        idx < @items.length && idx >= 0
    end

    def swap(idx1, idx2)
        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        else
            return false 
        end
    end

    def [](idx)
        if valid_index?(idx)
            return @items[idx]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------------"
        puts " " * 15 + @label
        puts "------------------------------------------------"
        puts "Index | " + "Item".ljust(22) + "| Deadline   | Done"
        puts "------------------------------------------------"
        @items.each_with_index do |item, idx|
            if item.done # 
                puts idx.to_s.ljust(6) + "| " + item.title.ljust(22) + "| " + item.deadline + " | [✓]"
            else
                puts idx.to_s.ljust(6) + "| " + item.title.ljust(22) + "| " + item.deadline + " | [ ]"
            end
        end 
        puts "------------------------------------------------"
    end

    def print_full_item(idx)
        if valid_index?(idx)
            puts "------------------------------------------------"
            puts "#{self[idx].title.ljust(30)}  #{self[idx].deadline}    [#{self[idx].done ? "✓" : " " }]"
            puts "#{self[idx].description.ljust(10)}"
            puts "------------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amt = 1)
        curr_idx = idx
        if valid_index?(idx)
            amt.times do
                if curr_idx > 0
                    self.swap(curr_idx, curr_idx - 1)
                    curr_idx -= 1
                end
            end
            return true
        else
            return false
        end
    end

    def down(idx, amt = 1)
        curr_idx = idx
        if valid_index?(idx)
            amt.times do
                if curr_idx < self.size - 1
                    self.swap(curr_idx, curr_idx + 1)
                    curr_idx += 1
                end
            end
            return true
        else
            return false
        end
    end

    def sort_by_date
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(idx)
        if valid_index?(idx)
            @items[idx].toggle
        end
    end

    def remove_item(idx)
        if valid_index?(idx)
            @items.delete_at(idx)
        else
            return false
        end
    end

    def purge
        i = 0
        while i < @items.length-1
            if @items[i].done
                @items.delete_at(i)
            else
                i += 1
            end
        end
    end

end

# pry 
# my_list = List.new('Groceries')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')

# load 'list.rb'
# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')

# l.print