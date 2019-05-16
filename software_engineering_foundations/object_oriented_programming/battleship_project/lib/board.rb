class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each { |subarr| puts subarr.join(" ") }
  end
  
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](indices)
    row, col = indices

    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos

    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H

      puts "you sunk my battleship!"
      
      true
    else
      self[pos] = :X

      false
    end
  end

  def place_random_ships
    while self.num_ships < @size / 4
      row = rand(@grid.length)
      col = rand(@grid.length)

      self[[row, col]] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |subarr|
      subarr.map do |el|
        if el == :S
          :N
        else
          el
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
