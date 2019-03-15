require 'byebug'

class PolyTreeNode

    attr_accessor :parent, :children, :value

    def initialize(value)
        @value = value
        @children = []
        @parent = nil

    end

    def parent=(parent_node)
        if parent != nil
            parent.children.reject! { |child| child == self }
        end
        @parent = parent_node 

        parent_node.children << self if parent_node != nil
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Error" unless children.include?(child_node)
        children.reject! { |child| child == child_node }
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            node = child.dfs(target_value)
            return node if node != nil
        end
        nil
    end 

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            curr_node = queue.shift
            return curr_node if curr_node.value == target_value
            queue.concat(curr_node.children)
        end
        nil
    end
    

end