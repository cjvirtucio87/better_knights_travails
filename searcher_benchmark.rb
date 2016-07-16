module KnightsTravails

  class SearcherBenchmark

    COORDS = [[3,7],[6,5],[7,6]]

    def self.run(tree)

      Benchmark.bmbm do |b|

        b.report("#dfs_for") do
          COORDS.each do |coords|
            10000.times do
              KnightsTravails::KnightSearcher.dfs_for(coords,tree)
            end
          end
        end

        b.report("#bfs_for") do
          COORDS.each do |coords|
            10000.times do
              KnightsTravails::KnightSearcher.bfs_for(coords,tree)
            end
          end
        end

      end

    end

  end

end