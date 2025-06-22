-- Roby Script Vehicle Legends Test01 - versi buka/tutup GUI

local CoreGui = game:GetService("CoreGui")
local player = game.Players.LocalPlayer

-- == GUI TOMBOL BUKA ==
local openBtn = Instance.new("TextButton", CoreGui)
openBtn.Size = UDim2.new(0, 80, 0, 30)
openBtn.Position = UDim2.new(0, 10, 0, 10)
openBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openBtn.Text = "ROBY"
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextSize = 14

-- == GUI UTAMA ==
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "Roby Script Vehicle Legends Test01"
gui.Enabled = false -- awalnya tersembunyi

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 250, 0, 180)
main.Position = UDim2.new(0.05, 0, 0.1, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -30, 0, 30)
title.Text = "Roby Script Vehicle Legends Test01"
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Position = UDim2.new(0, 0, 0, 0)
title.Padding = 5

-- Tombol close (-)
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "-"
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 16

-- Tombol Auto-Fly
local function addBtn(text, y, callback)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 14
    btn.MouseButton1Click:Connect(callback)
end

-- Track posisi terbang
local function fly(track)
    local car = nil
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Owner") and v.Owner.Value == player then
            car = v
            break
        end
    end

    if not car or not car.PrimaryPart then
        warn("Mobil tidak ditemukan.")
        return
    end

    for _, pos in ipairs(track) do
        car:SetPrimaryPartCFrame(CFrame.new(pos))
        wait(3 / 200 * 5) -- simulasi kecepatan 200 mph
    end
end

-- Tombol fungsi fly
addBtn("Auto‑Fly Keliling Kota", 50, function()
    fly({
        Vector3.new(500, 100, 1000),
        Vector3.new(700, 120, 800),
        Vector3.new(900, 100, 1000),
        Vector3.new(500, 100, 1000)
    })
end)

addBtn("Auto‑Fly Trek Lurus", 95, function()
    fly({
        Vector3.new(200, 100, 2000),
        Vector3.new(600, 100, 2000),
        Vector3.new(1000, 100, 2000)
    })
end)

-- == Interaksi buka/tutup GUI ==
openBtn.MouseButton1Click:Connect(function()
    gui.Enabled = true
end)

closeBtn.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)
