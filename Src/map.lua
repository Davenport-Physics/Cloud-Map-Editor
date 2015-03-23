--[[
----
----
----    Copyright (c) 2015 Michael Davenport
----
----
----    Permission is hereby granted, free of charge, to any person obtaining a 
----    copy of this software and associated documentation files (the "Software"),
----    to deal in the Software without restriction, including without limitation
----    the rights to use, copy, modify, merge, publish, distribute, sublicense, 
----    and/or sell copies of the Software, and to permit persons to whom the 
----    Software is furnished to do so, subject to the following conditions:
----
----    The above copyright notice and this permission notice shall be included
----    in all copies or substantial portions of the Software.
----
----    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
----    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
----    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
----    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
----    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
----    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
----    SOFTWARE.
----                
----
------]]


local M = {}

Map    = {}
Width  = nil
Height = nil

-- Doesn't process input by default
function M.AddBorders(Input)

    if CheckMapParameters() == false or Map == nil  then

	io.write("Did not add borders\n")
	return

    end

    -- Horizontal borders
    for i = 1, #Map[1] do

	Map[1][i]    = '#'
	Map[#Map][i] = '#'

    end

    -- Veritical borders
    for i = 1, #Map do

	Map[i][1]       = '#'
	Map[i][#Map[1]] = '#'

    end

end

function M.GeneratePlainMap()

    if CheckMapParameters() == false then

	io.write("Did not generate plain map\n")
	return

    end

    for y = 1, Height do

	Map[y] = {}
	for x = 1, Width do

	    Map[y][x] = '.'

	end

    end

    M.AddBorders()


end

-- Checks for nil values that prevent map editing from happening.
function CheckMapParameters()

    local bool = true
    if Width == nil then

        io.write("You forgot to specify width\n")
        bool = false

    end
    if Height == nil then

        io.write("You forgot to specify width\n")
        bool = false

    end

    return bool

end

function M.SetHeight(Input)

    Height = tonumber(Input)

    if Height == nil then

	io.write("Improperly formatted string.\n")
	io.write("Please retype in the form 'SetHeight <Number>'\n")

    end

end

function M.SetWidth(Input)

    Width = tonumber(Input)

    if Width == nil then

	io.write("Improperly formatted string.\n")
	io.write("Please retype in the form 'SetWidth <Number>'\n")

    end

end

function M.PrintHeight()

    print("Height = " .. tostring(Height))

end

function M.PrintWidth()

    print("Width = ".. tostring(Width))

end

function M.PrintMap()

    if Map == nil then

	io.write("Cannot print out map.\n")
	return

    end

    for y = 1, #Map do

	for x = 1, #Map[y] do

	    io.write(Map[y][x])

	end
	io.write("\n")

    end

end

function M.SaveMap(filename)

    local bool = true
    if Map == nil then

	io.write("Map var is nil.\n")
	bool = false

    end
    if #filename == 0 then

	io.write("No file name specified.\n")
	bool = false

    end

    if bool == false then

	io.write("Did not save map.\n")
	return

    end


    local fp = assert(io.open(filename,"w+"))    
    
    for y = 1, #Map do

	for x = 1, #Map[y] do

	    fp:write(Map[y][x])

	end
	fp:write("\n")

    end

    fp:close()

end

return M
