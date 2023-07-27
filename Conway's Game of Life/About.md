# Conway's Game of Life

Conway's Game of Life is a fascinating and iconic example of a cellular automaton, a mathematical model of a self-replicating system with simple rules. It was devised by the British mathematician John Horton Conway in 1970. Despite its simplicity, the Game of Life exhibits complex and often unpredictable behavior, making it an intriguing subject for study and exploration.

The "game" takes place on a two-dimensional grid of cells, each of which can be in one of two states: alive (represented by 1) or dead (represented by 0). At each discrete time step, the state of each cell evolves based on a set of rules that depend on the states of its neighboring cells.

## Game Rules

- The "game" is played on a two-dimensional grid of cells, where each cell is either 1 (alive) or 0 (dead).
- At each time step, each cell changes state depending on how many neighbors it has:
    - 0-1 neighbor: Cell becomes 0.
    - 2 neighbors: Cell state does not change.
    - 3 neighbors: Cell becomes 1.
    - 4+ neighbors: Cell becomes 0.

## Grid Behavior

- The game is formulated for an infinite grid, but in this circuit, we will use a 16x16 toroid, where the sides wrap around to the other side of the grid.
- For example, the corner cell (0,0) has 8 neighbors: (15,1), (15,0), (15,15), (0,1), (0,15), (1,1), (1,0), and (1,15).
- The 16x16 grid is represented by a length 256 vector, where each row of 16 cells is represented by a sub-vector:
    - `grid[15:0]` is row 0
    - `grid[31:16]` is row 1
    - And so on...

## Inputs and Outputs
- `clk`: A simple clock signal.
- `load`: Loads data into `grid` at the next clock edge, for loading the initial state.
- `data`: Data to be loaded.
- `grid`: The 16x16 current state of the game, updated every clock cycle.

## Time Step

The game state advances by one timestep every clock cycle.
