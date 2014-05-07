class GreatestProduct
    
    $grid 

    def initialize(grid)
         $grid = grid
         $greatest = 0
        unless  $grid[0].length == $grid.length
            abort("Grid dimensions must be even. Ex: 10*10 or 12*12")
        end
    end


    def right_and_left(x,y)

        temp_clac = $grid[x][y]*$grid[x][y+1]
        temp_clac = temp_clac * $grid[x][y+2]
        temp_clac = temp_clac * $grid[x][y+3]
        $greatest= [$greatest, temp_clac].max

        return $greatest
    end

    def down_and_up(x,y)

        temp_clac = $grid[x][y]*$grid[x+1][y]
        temp_clac = temp_clac * $grid[x+2][y]
        temp_clac = temp_clac * $grid[x+3][y]
        $greatest= [$greatest, temp_clac].max

        return $greatest
    end


    def diagonally_down_to_right(x,y)
        temp_clac = $grid[x][y]*$grid[x+1][y+1]
        temp_clac = temp_clac * $grid[x+2][y+2]
        temp_clac = temp_clac * $grid[x+3][y+3]
        $greatest= [$greatest, temp_clac].max

        return $greatest
    end

    def diagonally_down_to_left(x,y)
        temp_clac = $grid[x][y+3]*$grid[x+1][y+2]
        temp_clac = temp_clac * $grid[x+2][y+1]
        temp_clac = temp_clac * $grid[x+3][y]
        $greatest= [$greatest, temp_clac].max

        return $greatest
    end

    def run
        $rows = $grid[0].length-1
        $columns = $grid.length-1


        for x in (0..$rows).step(1) do
            
            for y in (0..$columns).step(1) do

                # Right and Left
                if y < $columns - 3
                   right_and_left(x,y)
                end

                # Down and Up
                if x < $rows - 3
                   down_and_up(x,y)
                end
                
                # Diagonally, down to the right
                if x < $rows - 3
                    if y < $columns - 3
                       diagonally_down_to_right(x,y) 
                    end
                end
                
                # Diagonally, down to the left
                if x < $rows - 3
                    if y < $columns - 3
                       diagonally_down_to_left(x,y)
                    end
                end

            end 

        end

        return $greatest

    end

    
end
