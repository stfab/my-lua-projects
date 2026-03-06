-- plot.lua
local io = require("io")

-- Funktion zum Erstellen des Graphen mit gnuplot
function create_graph()
    local gnuplot = io.popen("gnuplot", "w")
    gnuplot:write("set terminal png\n")
    gnuplot:write("set output 'graph.png'\n")
    gnuplot:write("set title 'Beispielgraph'\n")
    gnuplot:write("set xlabel 'X-Achse'\n")
    gnuplot:write("set ylabel 'Y-Achse'\n")
    gnuplot:write("set style data linespoints\n")
    gnuplot:write("plot '-' using 1:2 with linespoints title 'Daten'\n")

    -- Beispieldaten
    local data = {
        {1, 2},
        {2, 3},
        {3, 5},
        {4, 7},
        {5, 11}
    }

    for i = 1, #data do
        gnuplot:write(string.format("%d %d\n", data[i][1], data[i][2]))
    end

    gnuplot:write("e\n")
    gnuplot:close()
end

-- Aufruf der Funktion zum Erstellen des Graphen
create_graph()