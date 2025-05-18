-- init.lua

local android_id = "d111cbeff7e3d2fd"

local function simpleHash(str)
    local result = 0
    for i = 1, #str do
        result = result + string.byte(str, i) * i
    end
    return tostring(result)
end

local hwid = simpleHash(android_id)

print("[INFO] HWID đã sinh: " .. hwid)

if hwid == "11468" then
    getgenv().Key = "9605adcbe6b91566b761b45d"
    print("[KEY] Đã gán key hợp lệ.")
else
    warn("[KEY] HWID không đúng, không gán key.")
end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
