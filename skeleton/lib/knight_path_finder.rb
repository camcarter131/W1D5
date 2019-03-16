require_relative "00_tree_node.rb"

class KnightPathFinder

    attr_accessor :considered_positions, :root_node

    def self.valid_moves(pos)
        row, col = pos.first, pos.last
        moves = []
        
        (0..7).each do |n|
            (0..7).each do |m|
                if ((n-row).abs == 2 && (m-col).abs == 1) || ((n-row).abs == 1 && (m-col).abs == 2)
                    moves << [n,m]
                end
            end
        end

        moves
    end

    def initialize(initial_pos)
        @root_node = PolyTreeNode.new(initial_pos)
        @considered_positions = [initial_pos]
        build_move_tree
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).select do |move| 
            !@considered_positions.include?(move)
        end
        @considered_positions.concat(new_moves)

        new_moves
    end

    def build_move_tree
        new_moves = new_move_positions(root_node.value)
        queue = []
        queue << root_node.value
        new_moves.each do |new_move|
            if new_move == final_pos 
                
                return 
    end

    # def helper(array)
    #     @considered_positions.concat(array)
    # end

    
    
end
