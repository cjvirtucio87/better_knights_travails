Move = Struct.new(:x,:y,:depth,:children,:parent)


module KnightsTravails
  class MoveTree
    attr_reader :root

    ADJACENCIES = [[1,2],
                   [1,-2],
                   [-2,-1],
                   [2,-1],
                   [-1,2],
                   [-1,-2],
                   [-2,1],
                   [2,1]]

    def initialize(pos,max_depth)
      @root = Move.new(pos[0],pos[1],0,[],nil)
      build_tree(max_depth)
    end

    def render
      current = @root
      table = []
      while !current.children.empty?
        depth = current.depth + 1
        children = current.children
        table.push make_row(depth,children)
        current = current.children[0]
      end
      puts make_table(table)
    end

    private

      def make_row(depth,children)
        cells = children.map { |child| "[#{child.x},#{child.y}]" }
        "DEPTH #{depth}: #{cells.join(' ')}"
      end

      def make_table(table)
        max_width = table.max { |a,b| a.length <=> b.length }.length
        out = ""
        table.each { |row| out += row.ljust(max_width) + "\n" }
        out
      end

      #Root is depth zero. Its children are actually on the next level.
      #Insofar as the methods are concerned, the children start at the same
      #level as root. But the children are presented beginning with 
      #depth level 1.
      def build_tree(max_depth)
        depth = 0
        current = @root
        while depth < max_depth
          depth += 1
          populate(current,depth)
          current = current.children[0]
        end
      end

      def populate(current,depth)
        ADJACENCIES.each do |adj|
          if child = make_adj_move(current,adj,depth)
            current.children.push child
          end
        end
      end

      def make_adj_move(current,adj,depth)
        coords = calculate_coords(current,adj)
        if valid?(coords)
          return Move.new(coords[0],coords[1],depth,[],current)
        end
      end

      def calculate_coords(current,adj)
        [current.x+adj[0],current.y+adj[1]]
      end

      def valid?(coords)
        coords.each do |coord|
          return if !(0..7).include?(coord)
        end
        true
      end

  end
end
