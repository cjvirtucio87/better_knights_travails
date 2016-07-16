module KnightsTravails
  class KnightSearcher

    class << self

      def bfs_for(key,tree)
        current = tree.root
        queue = [[current]]
        until queue.empty?
          current = queue.shift
          if match_coord(current[0],key)
            return "Found at depth level #{current[0].depth}, index #{current[1]}"
          else
            current[0].children.each_with_index do |child,i| 
              queue.push([child,i])
            end
          end
        end
        raise "Couldn't find it"
      end

      def dfs_for(key,tree)
        current = tree.root
        stack = [[current]]
        until stack.empty?
          current = stack.pop
          if match_coord(current[0],key)
            return "Found at depth level #{current[0].depth}, index #{current[1]}"
          end
        end
      end

      private

        def match_coord(node,key)
          [node.x,node.y] == key
        end

    end

  end
end