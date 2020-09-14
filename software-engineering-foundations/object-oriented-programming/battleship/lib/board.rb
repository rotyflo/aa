class Board
    def self.print_grid(grid)
        grid.each { |row| puts row.join(' ') }
    end

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'You sunk my battleship!'
            return true
        end
        
        self[pos] = :X
        false
    end

    def place_random_ships
        ships = 0

        while ships < @size / 4
            rand_pos = [rand(@grid.length - 1), rand(@grid.length - 1)]

            if self[rand_pos] == :N
                self[rand_pos] = :S
                ships += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map { |pos| pos == :S ? :N : pos }
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
