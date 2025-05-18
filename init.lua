-- ⚙️ Android ID cố định (tuỳ mục đích sử dụng)
local android_id = "d111cbeff7e3d2fd"

-- Hàm hash đơn giản tạo HWID từ Android ID
local function simpleHash(str)
    local result = 0
    for i = 1, #str do
        result = result + string.byte(str, i) * i
    end
    return tostring(result)
end

-- Sinh HWID
local hwid = simpleHash(android_id)
print("[INFO] HWID đã sinh: " .. hwid)

-- Lấy key người dùng nhập
local inputKey = getgenv().Key or ""

-- Tải danh sách key từ file keys.txt trong repo bạn
local success, validKeys = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/duylee10037/mybloxfruit/main/keys.txt")
end)

-- Kiểm tra nếu không tải được danh sách key
if not success then
    warn("[KEY] ❌ Không thể tải danh sách key từ GitHub. Kiểm tra mạng hoặc repo.")
    return
end

-- Kiểm tra key có nằm trong danh sách key không
if string.find(validKeys, inputKey) then
    print("[KEY] ✅ Key hợp lệ, tiếp tục load script...")
else
    warn("[KEY] ❌ Sai key! Hãy truy cập link để lấy key hợp lệ.")
    return -- Dừng lại nếu sai key
end

-- Đợi game load trước khi thực hiện
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Tải BananaHub hoặc script chính của bạn
getgenv().Key = "9605adcbe6b91566b761b45d" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
