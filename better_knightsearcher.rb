module KnightsTravails
  class KnightSearcher

    class << self

      def bfs_for(key,tree)
        current = tree.root
        while current
          current.children.each_with_index do |child,i|
            if match_coord(child,key)
              return "Found at DEPTH #{current.depth}, index #{i}"
            end
          end
          current = current.children[0]
        end
        raise "Can't find designated key."
      end

      def dfs_for
      end

      private

        def match_coord(node,key)
          [node.x,node.y] == key
        end

    end

  end
end