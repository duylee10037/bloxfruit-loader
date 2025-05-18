-- init.lua

-- Android ID gốc của bạn
local android_id = "d111cbeff7e3d2fd"

-- Hàm hash đơn giản từ Android ID
local function simpleHash(str)
    local result = 0
    for i = 1, #str do
        result = result + string.byte(str, i) * i
    end
    return tostring(result)
end

-- Sinh HWID từ Android ID
local hwid = simpleHash(android_id)

-- In ra HWID để debug nếu cần
print("[INFO] HWID đã sinh: " .. hwid)

-- Kiểm tra HWID và gán key nếu đúng
if hwid == "11468" then
    getgenv().Key = "9605adcbe6b91566b761b45d"
    print("[KEY] Đã gán key hợp lệ.")
else
    warn("[KEY] HWID không đúng, không gán key.")
end

-- Đợi game load
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Load BananaHub
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
