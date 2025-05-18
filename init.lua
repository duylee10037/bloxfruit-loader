-- ⚙️ Android ID cố định (nếu bạn vẫn muốn giữ HWID)
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

local inputKey = getgenv().Key or ""

-- Tải danh sách key hợp lệ từ GitHub
local success, validKeys = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/duylee10037/bloxfruit-loader/main/keys.txt")
end)

if not success then
    warn("[KEY] ❌ ")
    return
end

-- ✅ Nếu key hợp lệ, load script chính
if string.find(validKeys, inputKey) then
    print("[KEY] ✅ Key hợp lệ.")
else
    -- ❌ Nếu key sai: Hiện UI cảnh báo + kick sau 5 giây
    warn("[KEY] ❌ Sai key. Kick trong 5 giây.")

    -- Tạo giao diện cảnh báo
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local StarterGui = game:GetService("StarterGui")

    local gui = Instance.new("ScreenGui")
    gui.Name = "KeyWarningGui"
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0.4, 0, 0.2, 0)
    frame.Position = UDim2.new(0.3, 0, 0.4, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 0.1

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "❌ Key sai! Bạn sẽ bị kick sau 5 giây."
    label.TextColor3 = Color3.fromRGB(255, 100, 100)
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true

    gui.Parent = player:WaitForChild("PlayerGui")

    task.wait(5)
    player:Kick("❌ Sai key! Vui lòng lấy lại key từ trang của bạn.")
    return
end

-- ✅ Nếu key đúng → tiếp tục load script
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "9605adcbe6b91566b761b45d"
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
