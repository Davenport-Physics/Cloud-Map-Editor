#!/bin/lua

local map = require("map")

function Help(Input)

    print("SetWidth <int>           -- Sets the width of the map")
    print("SetHeight <int>          -- Sets the Height of the map")
    print("GeneratePlainMap         -- Generates a plain old map")
    print("PrintMap                 -- Prints the map")
    print("SaveMap <filename>       -- Saves the map to the provided filename")
    print("quit, Quit, exit or Exit -- Exits the program")

end

function Pong(Input)

    print("pong")

end

--[[ 
--
--This table will be used in comparison tests but also
--used to call the correct function.
--
----]]
MapFunctions = {
{name = "AddBorders"      , Call = map.AddBorders},
{name = "SetHeight"       , Call = map.SetHeight},
{name = "SetWidth"        , Call = map.SetWidth},
{name = "PrintWidth"      , Call = map.PrintWidth},
{name = "PrintHeight"     , Call = map.PrintHeight },
{name = "GeneratePlainMap", Call = map.GeneratePlainMap},
{name = "PrintMap"        , Call = map.PrintMap},
{name = "SaveMap"         , Call = map.SaveMap}}

MainFunctions = {

{name = "help", Call = Help},
{name = "ping", Call = Pong}

}

function main ()    

    local done = false
    while done == false do

	io.write("> ")
	done = HandleInput(io.read()) 

    end

    io.write("Cloud map editor exited successfully.\n")

end

function HandleInput(Input)

    if HandleInput_Functions(MapFunctions, Input) == true then

	return false

    elseif HandleInput_Functions(MainFunctions, Input) == true then

	return false

    else

	return HandleInput_Quit(Input)

    end

end

function HandleInput_Functions(Functions,Input)

    for i = 1, #Functions do

        if string.find(Input, Functions[i].name) ~= nil then

            FirstPosition, SecondPosition = string.find(Input, Functions[i].name)

            Functions[i].Call(string.sub(Input, SecondPosition+1, #Input))

	    return true

        end

    end

    return false

end

function HandleInput_Quit(Input)

    if string.find(Input, "Quit") or string.find(Input, "quit") then

        return true

    elseif string.find(Input, "exit") or string.find(Input, "Exit") then

        return true

    end

    return false

end

main()
