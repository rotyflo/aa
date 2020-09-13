class Board
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
        count = 0
        (0...@grid.length).each do |x|
            (0...@grid.length).each do |y|
                count += 1 if @grid[x][y] == :S
            end
        end
        count
    end
end
