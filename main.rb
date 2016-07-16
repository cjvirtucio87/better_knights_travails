require './better_movetree'
require './better_knightsearcher'

tree = KnightsTravails::MoveTree.new([3,3],3)
tree.render

puts KnightsTravails::KnightSearcher.bfs_for([3,7],tree)