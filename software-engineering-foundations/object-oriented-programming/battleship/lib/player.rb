class Player
    def get_move
        p "enter a position seperated with a space, like '0 1'"
        gets.chomp.split.map(&:to_i)
    end
end
