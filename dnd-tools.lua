-- get JSON data from file
local tools = {}
--local data = require("json")

function getJSONdata(fileName)
    require("lualibs.lua")
    local f = io.open(fileName, 'r')
    local s = f:read('*a')
    f:close()
    luadata = utilities.json.tolua(s)
    -- luadatasize = table.getn(luadata['spells'])

    CRtoXP = {}
    CRtoXP["0"] = "0"
    CRtoXP["1/8"] = "25"
    CRtoXP["1/4"] = "50"
    CRtoXP["1/2"] = "100"
    CRtoXP["1"] = "200"
    CRtoXP["2"] = "450"
    CRtoXP["3"] = "700"
    CRtoXP["4"] = "1,100"
    CRtoXP["5"] = "1,800"
    CRtoXP["6"] = "2,300"
    CRtoXP["7"] = "2,900"
    CRtoXP["8"] = "3,900"
    CRtoXP["9"] = "5,000"
    CRtoXP["10"] = "5,900"
    CRtoXP["11"] = "7,200"
    CRtoXP["12"] = "8,400"
    CRtoXP["13"] = "10,000"
    CRtoXP["14"] = "11,500"
    CRtoXP["15"] = "13,000"
    CRtoXP["16"] = "15,000"
    CRtoXP["17"] = "18,000"
    CRtoXP["18"] = "20,000"
    CRtoXP["19"] = "22,000"
    CRtoXP["20"] = "25,000"
    CRtoXP["21"] = "33,000"
    CRtoXP["22"] = "41,000"
    CRtoXP["23"] = "50,000"
    CRtoXP["24"] = "62,000"
    CRtoXP["25"] = "75,000"
    CRtoXP["26"] = "90,000"
    CRtoXP["27"] = "105,000"
    CRtoXP["28"] = "120,000"
    CRtoXP["29"] = "135,000"
    CRtoXP["30"] = "155,000"
end

return luadata