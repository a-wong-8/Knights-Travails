class PolyTreeNode
   
    attr_reader :value, :children, :parent

    def initialize(value)
        @value = value
        @children = []
        @parent = nil 
    end 

    def parent=(node)
        if @parent != nil 
            @parent.children.delete(self)
        end
        
        @parent = node
        if @parent != nil && !node.children.include?(self)  
            node.children << self
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise 'no child!' if !self.children.include?(node)
        node.parent = nil 
    end

    def dfs(target)
        if self.value == target
            return self
        end
        result = nil
        self.children.each do |child|
            result ||= child.dfs(target)
        end
        return result
    end

    def bfs(target)
        queue = [self]
        while !queue.empty?
            current = queue.shift
            if current.value == target
                return current
            end
            queue += current.children
        end
        nil 
    end

end