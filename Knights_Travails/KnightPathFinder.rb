require_relative "./tree_node.rb"
class KnightPathFinder

    def self.valid_moves(pos)
        valid_positions = []
        i, j = pos
        (0...8).each do |row|
            (0...8).each do |col|
                if ((i - row).abs == 2 && (j - col).abs == 1) || ((i - row).abs == 1 && (j - col).abs == 2)
                   valid_positions << [row, col]
                end
            end
        end
        valid_positions
    end
    
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []

        build_move_tree
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos)
        filtered_positions = []
        positions.each do |position|
            if !@considered_positions.include?(position)
                filtered_positions << position
                @considered_positions << position
            end
        end
        return filtered_positions
    end

    # def build_move_tree
    #     queue = [@root_node]

    #     new_move_positions(@root_node.value)


    # end






end


