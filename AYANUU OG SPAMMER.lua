-- Delta Multi Player Spammer + Premium Glassmorphism UI V6.0
-- Custom Engineered for AYANUU

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleCircle = Instance.new("TextButton")
local CircleCorner = Instance.new("UICorner")

-- Navigation & Control Toggles
local SideToggleBtn = Instance.new("TextButton")
local ToggleBtn = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")

-- Settings Inputs
local YourNameInput = nil
local CustomMsgInput = nil
local FastBtn = Instance.new("TextButton")
local SlowBtn = Instance.new("TextButton")
local UserDefinedDelay = 2.5

local PaddingToggleBtn = Instance.new("TextButton")
local AutoToggleBtn = Instance.new("TextButton")
local ManualContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

local TargetsScrollingFrame = Instance.new("ScrollingFrame")
local TargetsListLayout = Instance.new("UIListLayout")
local TargetsTextBoxesList = {}

-- Interactive Framework
local DialogFrame = Instance.new("Frame")
local DialogLabel = Instance.new("TextLabel")
local YesBtn = Instance.new("TextButton")
local NoBtn = Instance.new("TextButton")

local antiAfkActive = true
local antiFlingActive = true

local PaddingsList = {
    " ______________________________________________________________", 
    " - _ - _ - _ - _ - _ - _ - _ - _ - _ - _-- _ - _ - _ - _ - _ - ", 
    " o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|",         
    " (!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)", 
    " @=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=" 
}

-- Main Frame Config (Thicker & Shifted Upwards)
MainFrame.Name = "AyanPremiumSpammer"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BackgroundTransparency = 0.35 -- Glass Effect (Gameplay visibility)
MainFrame.Position = UDim2.new(0.12, 0, 0.15, 0) -- Fixed vertical position
MainFrame.Size = UDim2.new(0, 360, 0, 540) -- Made thicker
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(0, 255, 200)
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- Premium Glass Background Frost Effect Filter
local BlurImage = Instance.new("ImageLabel")
BlurImage.Name = "GlassBlurFilter"
BlurImage.Parent = MainFrame
BlurImage.Size = UDim2.new(1, 0, 1, 0)
BlurImage.Image = "rbxassetid://13414163456"
BlurImage.ImageTransparency = 0.92
BlurImage.ScaleType = Enum.ScaleType.Crop
local BlurCorner = Instance.new("UICorner")
BlurCorner.CornerRadius = UDim.new(0, 16)
BlurCorner.Parent = BlurImage

-- ==========================================
-- 🛡️ "PLAYER" UTILITY PANEL (RIGHT SIDE 1) 🛡️
-- ==========================================
local PlayerPanel = Instance.new("Frame")
PlayerPanel.Name = "PlayerPanel"
PlayerPanel.Parent = MainFrame
PlayerPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
PlayerPanel.BackgroundTransparency = 0.4
PlayerPanel.Position = UDim2.new(1, 10, 0, 0)
PlayerPanel.Size = UDim2.new(0, 180, 0, 140)

local PlrCorner = Instance.new("UICorner")
PlrCorner.CornerRadius = UDim.new(0, 12)
PlrCorner.Parent = PlayerPanel

local PlrStroke = Instance.new("UIStroke")
PlrStroke.Thickness = 1.5
PlrStroke.Color = Color3.fromRGB(255, 0, 100)
PlrStroke.Transparency = 0.4
PlrStroke.Parent = PlayerPanel

local PlrTitle = Instance.new("TextLabel")
PlrTitle.Size = UDim2.new(1, 0, 0, 30)
PlrTitle.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
PlrTitle.BackgroundTransparency = 0.2
PlrTitle.Font = Enum.Font.SourceSansBold
PlrTitle.Text = "🛡️ PLAYER STATUS"
PlrTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlrTitle.TextSize = 13
PlrTitle.Parent = PlayerPanel
local PtCorner = Instance.new("UICorner") PtCorner.CornerRadius = UDim.new(0,12) PtCorner.Parent = PlrTitle

local AntiAfkToggleBtn = Instance.new("TextButton")
local AntiFlingToggleBtn = Instance.new("TextButton")

local function StylePlrButton(btn, text, pos, active)
    btn.Parent = PlayerPanel
    btn.Position = pos
    btn.Size = UDim2.new(1, -20, 0, 32)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.BackgroundColor3 = active and Color3.fromRGB(35, 150, 80) or Color3.fromRGB(180, 50, 50)
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 6) c.Parent = btn
end
StylePlrButton(AntiAfkToggleBtn, "🛡️ ANTI-AFK: ON", UDim2.new(0, 10, 0, 45), true)
StylePlrButton(AntiFlingToggleBtn, "🛡️ ANTI-FLING: ON", UDim2.new(0, 10, 0, 88), true)

-- ==========================================
-- 👑 PREMIUM UTILITIES SIDE PANEL (RIGHT SIDE 2) 👑
-- ==========================================
local SidePanel = Instance.new("Frame")
local SideTitle = Instance.new("TextLabel")
local SearchBar = Instance.new("TextBox")
local PlayerScroll = Instance.new("ScrollingFrame")
local PlayerListLayout = Instance.new("UIListLayout")
local CmdScroll = Instance.new("ScrollingFrame")
local CmdListLayout = Instance.new("UIListLayout")

SidePanel.Name = "AyanSidePanel"
SidePanel.Parent = MainFrame
SidePanel.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
SidePanel.BackgroundTransparency = 0.4
SidePanel.Position = UDim2.new(1, 10, 0, 155)
SidePanel.Size = UDim2.new(0, 240, 0, 385)
SidePanel.Visible = true

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 14)
SideCorner.Parent = SidePanel

local SideStroke = Instance.new("UIStroke")
SideStroke.Thickness = 1.5
SideStroke.Color = Color3.fromRGB(0, 180, 255)
SideStroke.Transparency = 0.4
SideStroke.Parent = SidePanel

SideTitle.Size = UDim2.new(1, 0, 0, 30)
SideTitle.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
SideTitle.BackgroundTransparency = 0.2
SideTitle.Font = Enum.Font.SourceSansBold
SideTitle.Text = "⚡ TARGET CONTROLS"
SideTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SideTitle.TextSize = 13
SideTitle.Parent = SidePanel
local StCorner = Instance.new("UICorner") StCorner.CornerRadius = UDim.new(0, 14) StCorner.Parent = SideTitle

SearchBar.Parent = SidePanel
SearchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
SearchBar.BackgroundTransparency = 0.3
SearchBar.Position = UDim2.new(0, 10, 0, 38)
SearchBar.Size = UDim2.new(1, -20, 0, 28)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.PlaceholderText = "🔍 Search Target Player..."
SearchBar.Text = ""
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.TextSize = 12
local Sc = Instance.new("UICorner") Sc.CornerRadius = UDim.new(0, 6) Sc.Parent = SearchBar

PlayerScroll.Parent = SidePanel
PlayerScroll.BackgroundTransparency = 1
PlayerScroll.Position = UDim2.new(0, 10, 0, 72)
PlayerScroll.Size = UDim2.new(1, -20, 0, 120)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.ScrollBarThickness = 3
PlayerListLayout.Parent = PlayerScroll
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerListLayout.Padding = UDim.new(0, 4)

CmdScroll.Parent = SidePanel
CmdScroll.BackgroundTransparency = 1
CmdScroll.Position = UDim2.new(0, 10, 0, 200)
CmdScroll.Size = UDim2.new(1, -20, 0, 175)
CmdScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
CmdScroll.ScrollBarThickness = 3
CmdListLayout.Parent = CmdScroll
CmdListLayout.SortOrder = Enum.SortOrder.LayoutOrder
CmdListLayout.Padding = UDim.new(0, 5)

-- Neon Gradient Loop
task.spawn(function()
    local hue = 0
    while task.wait(0.03) do
        hue = hue + 1
        if hue > 360 then hue = 0 end
        local rainbowColor = Color3.fromHSV(hue/360, 0.8, 1)
        MainStroke.Color = rainbowColor
        SideStroke.Color = rainbowColor
        PlrStroke.Color = rainbowColor
        Title.TextColor3 = rainbowColor
    end
end)

if syn and syn.protect_gui then syn.protect_gui(ScreenGui)
elseif getgenv and getgenv().protect_gui then getgenv().protect_gui(ScreenGui) end
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

ToggleCircle.Parent = ScreenGui
ToggleCircle.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ToggleCircle.Position = UDim2.new(0, 15, 0.4, 0)
ToggleCircle.Size = UDim2.new(0, 50, 0, 50)
ToggleCircle.Font = Enum.Font.SourceSansBold
ToggleCircle.Text = "⚡"
ToggleCircle.TextColor3 = Color3.fromRGB(0, 255, 200)
ToggleCircle.TextSize = 24
ToggleCircle.Active = true
ToggleCircle.Draggable = true
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = ToggleCircle
local CircleStroke = Instance.new("UIStroke") CircleStroke.Thickness = 2 CircleStroke.Color = Color3.fromRGB(0,255,200) CircleStroke.Parent = ToggleCircle

ToggleCircle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Title.Name = "HeaderTitle"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Title.BackgroundTransparency = 0.5
Title.Size = UDim2.new(1, 0, 0, 34)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "👑 AYANUU PREMIUM DASHBOARD V6.0 👑"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
local Tc = Instance.new("UICorner") Tc.CornerRadius = UDim.new(0, 16) Tc.Parent = Title

SideToggleBtn.Parent = MainFrame
SideToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
SideToggleBtn.Position = UDim2.new(1, -125, 0, 5)
SideToggleBtn.Size = UDim2.new(0, 120, 0, 24)
SideToggleBtn.Font = Enum.Font.SourceSansBold
SideToggleBtn.Text = "🔄 Toggle Side Panel"
SideToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SideToggleBtn.TextSize = 11
SideToggleBtn.ZIndex = 5

local Stc = Instance.new("UICorner")
Stc.CornerRadius = UDim.new(0, 6)
Stc.Parent = SideToggleBtn

SideToggleBtn.MouseButton1Click:Connect(function()
    if SidePanel and PlayerPanel then
        SidePanel.Visible = not SidePanel.Visible
        PlayerPanel.Visible = not PlayerPanel.Visible
    end
end)

TargetsScrollingFrame.Parent = MainFrame
Use code with caution.
TargetsScrollingFrame.BackgroundTransparency = 1
TargetsScrollingFrame.Position = UDim2.new(0, 15, 0, 42)
TargetsScrollingFrame.Size = UDim2.new(1, -30, 0, 95)
TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
TargetsScrollingFrame.ScrollBarThickness = 3
TargetsListLayout.Parent = TargetsScrollingFrame
TargetsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TargetsListLayout.Padding = UDim.new(0, 4)
local function TriggerInteractiveQuestion()
DialogFrame.Visible = true
end
local function CreateDynamicTargetRow(optionalText)
local RowFrame = Instance.new("Frame")
local NewBox = Instance.new("TextBox")
local BoxCorner = Instance.new("UICorner")
local DeleteBtn = Instance.new("TextButton")
local DelCorner = Instance.new("UICorner")
RowFrame.Size = UDim2.new(1, 0, 0, 26)
RowFrame.BackgroundTransparency = 1
RowFrame.Parent = TargetsScrollingFrame
NewBox.Parent = RowFrame
NewBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
NewBox.BackgroundTransparency = 0.3
NewBox.Size = UDim2.new(1, -32, 1, 0)
NewBox.Font = Enum.Font.SourceSans
NewBox.PlaceholderText = "Type targeted player..."
NewBox.Text = optionalText or ""
NewBox.TextColor3 = Color3.fromRGB(255, 255, 255)
NewBox.TextSize = 12
BoxCorner.CornerRadius = UDim.new(0, 5)
BoxCorner.Parent = NewBox
DeleteBtn.Parent = RowFrame
DeleteBtn.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
DeleteBtn.Position = UDim2.new(1, -26, 0, 0)
DeleteBtn.Size = UDim2.new(0, 26, 1, 0)
DeleteBtn.Font = Enum.Font.SourceSansBold
DeleteBtn.Text = "❌"
DeleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteBtn.TextSize = 9
DelCorner.CornerRadius = UDim.new(0, 5)
DelCorner.Parent = DeleteBtn
table.insert(TargetsTextBoxesList, NewBox)
TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TargetsListLayout.AbsoluteContentSize.Y)
NewBox.FocusLost:Connect(function()
if NewBox.Text ~= "" and NewBox.Text ~= " " then TriggerInteractiveQuestion() end
end)
DeleteBtn.MouseButton1Click:Connect(function()
for idx, trackedBox in ipairs(TargetsTextBoxesList) do
if trackedBox == NewBox then table.remove(TargetsTextBoxesList, idx) break end
end
RowFrame:Destroy()
task.wait(0.05)
TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TargetsListLayout.AbsoluteContentSize.Y)
end)
end
DialogFrame.Parent = MainFrame
DialogFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
DialogFrame.Position = UDim2.new(0, 15, 0, 142)
DialogFrame.Size = UDim2.new(1, -30, 0, 48)
DialogFrame.Visible = false
local dfc = Instance.new("UICorner") dfc.CornerRadius = UDim.new(0,6) dfc.Parent = DialogFrame
DialogLabel.Parent = DialogFrame
DialogLabel.BackgroundTransparency = 1
DialogLabel.Position = UDim2.new(0, 5, 0, 3)
DialogLabel.Size = UDim2.new(1, -10, 0, 18)
DialogLabel.Font = Enum.Font.SourceSansBold
DialogLabel.Text = "❓ Track another target simultaneously?"
DialogLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
DialogLabel.TextSize = 12
local function configureDialogButton(btn, text, pos, bgCol)
btn.Parent = DialogFrame
btn.BackgroundColor3 = bgCol
btn.Position = pos
btn.Size = UDim2.new(0, 150, 0, 22)
btn.Font = Enum.Font.SourceSansBold
btn.Text = text
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 11
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,4) c.Parent = btn
end
configureDialogButton(YesBtn, "✔ YES (Add More)", UDim2.new(0, 8, 0, 23), Color3.fromRGB(35, 140, 75))
configureDialogButton(NoBtn, "❌ NO (Lock List)", UDim2.new(0, 172, 0, 23), Color3.fromRGB(150, 40, 40))
YesBtn.MouseButton1Click:Connect(function() CreateDynamicTargetRow() end)
NoBtn.MouseButton1Click:Connect(function() DialogFrame.Visible = false end)
CreateDynamicTargetRow()
local function CreateTextBox(placeholder, pos)
local box = Instance.new("TextBox")
box.Parent = MainFrame
box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
box.BackgroundTransparency = 0.3
box.Position = pos
box.Size = UDim2.new(1, -30, 0, 26)
box.Font = Enum.Font.SourceSans
box.PlaceholderText = placeholder
box.Text = ""
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.TextSize = 12
local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 5) corner.Parent = box
return box
end
YourNameInput = CreateTextBox("Type Identity Title Name (Default: AYANUU)...", UDim2.new(0, 15, 0, 195))
CustomMsgInput = CreateTextBox("Type Premium Custom Message...", UDim2.new(0, 15, 0, 228))
local function setupSpeedBtn(btn, text, pos)
btn.Parent = MainFrame
btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
btn.Position = pos
btn.Size = UDim2.new(0, 160, 0, 26)
btn.Font = Enum.Font.SourceSansBold
btn.Text = text
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,5) c.Parent = btn
end
setupSpeedBtn(FastBtn, "⚡ FAST ENGINE", UDim2.new(0, 15, 0, 262))
setupSpeedBtn(SlowBtn, "🐢 CONSERVATIVE", UDim2.new(0, 185, 0, 262))
FastBtn.MouseButton1Click:Connect(function()
UserDefinedDelay = 0.4
FastBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
SlowBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
end)
SlowBtn.MouseButton1Click:Connect(function()
UserDefinedDelay = 3.5
SlowBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
FastBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
end)
local usePadding = true
local autoPadding = true
local manualPaddingIndex = 5
PaddingToggleBtn.Parent = MainFrame
PaddingToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 140, 75)
PaddingToggleBtn.Position = UDim2.new(0, 15, 0, 295)
PaddingToggleBtn.Size = UDim2.new(0, 160, 0, 26)
PaddingToggleBtn.Font = Enum.Font.SourceSansBold
PaddingToggleBtn.Text = "Spectrum Padding: ON"
PaddingToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PaddingToggleBtn.TextSize = 11
local pbc = Instance.new("UICorner") pbc.CornerRadius = UDim.new(0,5) pbc.Parent = PaddingToggleBtn
PaddingToggleBtn.MouseButton1Click:Connect(function()
usePadding = not usePadding
PaddingToggleBtn.BackgroundColor3 = usePadding and Color3.fromRGB(35, 140, 75) or Color3.fromRGB(160, 40, 40)
PaddingToggleBtn.Text = usePadding and "Spectrum Padding: ON" or "Spectrum Padding: OFF"
end)
AutoToggleBtn.Parent = MainFrame
AutoToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 140, 75)
AutoToggleBtn.Position = UDim2.new(0, 185, 0, 295)
AutoToggleBtn.Size = UDim2.new(0, 160, 0, 26)
AutoToggleBtn.Font = Enum.Font.SourceSansBold
AutoToggleBtn.Text = "Auto Rotation: ON"
AutoToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoToggleBtn.TextSize = 11
local abc = Instance.new("UICorner") abc.CornerRadius = UDim.new(0,5) abc.Parent = AutoToggleBtn
AutoToggleBtn.MouseButton1Click:Connect(function()
autoPadding = not autoPadding
AutoToggleBtn.BackgroundColor3 = autoPadding and Color3.fromRGB(35, 140, 75) or Color3.fromRGB(160, 40, 40)
AutoToggleBtn.Text = autoPadding and "Auto Rotation: ON" or "Auto Rotation: OFF"
ManualContainer.Visible = not autoPadding
end)
ManualContainer.Parent = MainFrame
ManualContainer.BackgroundTransparency = 1
ManualContainer.Position = UDim2.new(0, 15, 0, 328)
ManualContainer.Size = UDim2.new(1, -30, 0, 26)
ManualContainer.Visible = false
UIListLayout.Parent = ManualContainer
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
local SelectorButtons = {}
local paddingLabels = {"__", "--", "o_O", "(!)", "@="}
for i, label in ipairs(paddingLabels) do
local btn = Instance.new("TextButton")
btn.Parent = ManualContainer
btn.BackgroundColor3 = (i == manualPaddingIndex) and Color3.fromRGB(200, 40, 40) or Color3.fromRGB(35, 35, 45)
btn.Size = UDim2.new(0, 62, 1, 0)
btn.Font = Enum.Font.SourceSansBold
btn.Text = label
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 11
local bC = Instance.new("UICorner") bC.CornerRadius = UDim.new(0,4) bC.Parent = btn
SelectorButtons[i] = btn
btn.MouseButton1Click:Connect(function()
manualPaddingIndex = i
for idx, b in ipairs(SelectorButtons) do b.BackgroundColor3 = (idx == manualPaddingIndex) and Color3.fromRGB(200, 40, 40) or Color3.fromRGB(35, 35, 45) end
end)
end
-- ==========================================
-- 🛡️ SYSTEM SECURE LOGIC ENGINE (AFK/FLING) 🛡️
-- ==========================================
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local p = Players.LocalPlayer
local AfkScreenGui = nil
local function CreateAfkGui()
if CoreGui:FindFirstChild("AYANUU_AFK_Timer") then CoreGui.AYANUU_AFK_Timer:Destroy() end
AfkScreenGui = Instance.new("ScreenGui")
AfkScreenGui.Name = "AYANUU_AFK_Timer"
AfkScreenGui.Parent = CoreGui
local AfkMainFrame = Instance.new("Frame")
AfkMainFrame.Size = UDim2.new(0, 240, 0, 150)
AfkMainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
AfkMainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
AfkMainFrame.Active = true
AfkMainFrame.Draggable = true
AfkMainFrame.Parent = AfkScreenGui
Instance.new("UICorner", AfkMainFrame).CornerRadius = UDim.new(0, 10)
local Header = Instance.new("Frame", AfkMainFrame)
Header.Size = UDim2.new(1, 0, 0, 25)
Header.BackgroundTransparency = 1
local TitleLabel = Instance.new("TextLabel", Header)
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Text = "AYANUU SYSTEM MONITOR"
TitleLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.SourceSansBold
local TimerLabel = Instance.new("TextLabel", AfkMainFrame)
TimerLabel.Size = UDim2.new(1, 0, 0, 40)
TimerLabel.Position = UDim2.new(0, 0, 0, 40)
TimerLabel.Text = "000:00:00"
TimerLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
TimerLabel.TextSize = 20
TimerLabel.Font = Enum.Font.Code
TimerLabel.BackgroundTransparency = 1
local startTime = tick()
task.spawn(function()
while AfkScreenGui and AfkScreenGui.Parent do
local elapsed = tick() - startTime
local hours = math.floor(elapsed / 3600)
local minutes = math.floor((elapsed % 3600) / 60)
local seconds = math.floor(elapsed % 60)
TimerLabel.Text = string.format("%03d:%02d:%02d", hours, minutes, seconds)
task.wait(1)
end
end)
end
CreateAfkGui()
p.Idled:Connect(function()
if antiAfkActive then
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new(0, 0))
end
end)
AntiAfkToggleBtn.MouseButton1Click:Connect(function()
antiAfkActive = not antiAfkActive
AntiAfkToggleBtn.BackgroundColor3 = antiAfkActive and Color3.fromRGB(35, 150, 80) or Color3.fromRGB(180, 50, 50)
AntiAfkToggleBtn.Text = antiAfkActive and "🛡️ ANTI-AFK: ON" or "🛡️ ANTI-AFK: OFF"
if antiAfkActive then CreateAfkGui() else if CoreGui:FindFirstChild("AYANUU_AFK_Timer") then CoreGui.AYANUU_AFK_Timer:Destroy() end end
end)
local connections = {}
local function setupCharacterCollision(character)
local steppedConn = RunService.Stepped:Connect(function()
if antiFlingActive and character:IsDescendantOf(Workspace) then
for _, part in ipairs(character:GetChildren()) do
if part:IsA("BasePart") then part.CanCollide = false end
end
end
end)
character.Destroying:Connect(function() steppedConn:Disconnect() end)
end
local function trackPlayer(player)
if player == p then return end
player.CharacterAdded:Connect(setupCharacterCollision)
if player.Character then setupCharacterCollision(player.Character) end
end
for _, player in ipairs(Players:GetPlayers()) do trackPlayer(player) end
local orgAdded = Players.PlayerAdded:Connect(trackPlayer)
AntiFlingToggleBtn.MouseButton1Click:Connect(function()
antiFlingActive = not antiFlingActive
AntiFlingToggleBtn.BackgroundColor3 = antiFlingActive and Color3.fromRGB(35, 150, 80) or Color3.fromRGB(180, 50, 50)
AntiFlingToggleBtn.Text = antiFlingActive and "🛡️ ANTI-FLING: ON" or "🛡️ ANTI-FLING: OFF"
end)
-- ==========================================
-- 🛠️ PREMIUM TARGET POSITION FIX IMPLEMENTATION 🛠️
-- ==========================================
local ActiveSideTarget = ""
local CurrentLoopRoutine = nil
local function ClearActiveLoops()
if CurrentLoopRoutine then task.cancel(CurrentLoopRoutine) CurrentLoopRoutine = nil end
workspace.CurrentCamera.CameraSubject = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
end
local function GetTargetCharacter()
if ActiveSideTarget == "" then return nil end
local targetPlr = Players:FindFirstChild(ActiveSideTarget)
if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then return targetPlr.Character, targetPlr end
return nil
end
local function InitTargetLockLoop(cframeOffset)
ClearActiveLoops()
CurrentLoopRoutine = task.spawn(function()
while task.wait() do
local char = GetTargetCharacter()
if char and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
p.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * cframeOffset
end
end
end)
end
local function TriggerOrbitMode()
ClearActiveLoops()
CurrentLoopRoutine = task.spawn(function()
local angle = 0
while task.wait() do
local char = GetTargetCharacter()
if char and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
angle = angle + 0.1
local offset = Vector3.new(math.sin(angle) * 5, 2, math.cos(angle) * 5)
p.Character.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position + offset, char.HumanoidRootPart.Position)
end
end
end)
end

local function ApplyEspHighlight()
local char = GetTargetCharacter()
if char then
if char:FindFirstChild("AyanHighlight") then char.AyanHighlight:Destroy() end
local hl = Instance.new("Highlight")
hl.Name = "AyanHighlight"
hl.FillColor = Color3.fromRGB(0, 255, 200)
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.Parent = char
end
end
local CommandsList = {
{name = "💥 Bang", action = function()
ClearActiveLoops()
CurrentLoopRoutine = task.spawn(function()
while task.wait() do
local char = GetTargetCharacter()
if char and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
for i = 1, 10 do
p.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.2 + (i * 0.1))
task.wait(0.01)
end
end
end
end)
end},
{name = "👄 Mouthbang", action = function() InitTargetLockLoop(CFrame.new(0, 0.3, -1.1) * CFrame.Angles(0, math.rad(180), 0)) end},
{name = "🧑‍🦼 Headsit", action = function() InitTargetLockLoop(CFrame.new(0, 2.6, 0)) end},
{name = "🧘 Backsit", action = function() InitTargetLockLoop(CFrame.new(0, 0.4, 1.1)) end},
{name = "🌀 Orbit", action = TriggerOrbitMode},
{name = "👁️ View", action = function()
local char = GetTargetCharacter()
if char and char:FindFirstChildOfClass("Humanoid") then workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid") end
end},
{name = "📌 ESP", action = ApplyEspHighlight},
{name = "🛑 STOP ALL", action = function()
ClearActiveLoops()
for _, plr in ipairs(Players:GetPlayers()) do
if plr.Character and plr.Character:FindFirstChild("AyanHighlight") then plr.Character.AyanHighlight:Destroy() end
end
end}
}
for _, cmd in ipairs(CommandsList) do
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, 0, 0, 30)
btn.BackgroundColor3 = cmd.name == "🛑 STOP ALL" and Color3.fromRGB(180, 40, 40) or Color3.fromRGB(28, 28, 40)
btn.Font = Enum.Font.SourceSansBold
btn.Text = cmd.name
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
btn.Parent = CmdScroll
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 6) c.Parent = btn
btn.MouseButton1Click:Connect(cmd.action)
end
CmdScroll.CanvasSize = UDim2.new(0, 0, 0, CmdListLayout.AbsoluteContentSize.Y)
local function RebuildPlayerListGrid()
for _, item in ipairs(PlayerScroll:GetChildren()) do if item:IsA("TextButton") then item:Destroy() end end
local filterText = SearchBar.Text:lower()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= p and (filterText == "" or plr.Name:lower():find(filterText) or plr.DisplayName:lower():find(filterText)) then
local pBtn = Instance.new("TextButton")
pBtn.Size = UDim2.new(1, 0, 0, 24)
pBtn.BackgroundColor3 = (ActiveSideTarget == plr.Name) and Color3.fromRGB(200, 45, 45) or Color3.fromRGB(25, 25, 35)
pBtn.Font = Enum.Font.SourceSans
pBtn.Text = "👤 " .. plr.DisplayName .. " (@" .. plr.Name .. ")"
pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
pBtn.TextSize = 11
pBtn.Parent = PlayerScroll
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 4) c.Parent = pBtn
pBtn.MouseButton1Click:Connect(function()
ActiveSideTarget = plr.Name
CreateDynamicTargetRow(plr.Name)
RebuildPlayerListGrid()
end)
end
end
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, PlayerListLayout.AbsoluteContentSize.Y)
end
SearchBar.Changed:Connect(function(prop) if prop == "Text" then RebuildPlayerListGrid() end end)
Players.PlayerAdded:Connect(RebuildPlayerListGrid)
Players.PlayerRemoving:Connect(RebuildPlayerListGrid)
task.spawn(RebuildPlayerListGrid)
-- Spammer Initialization Engine Blocks
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
ToggleBtn.Position = UDim2.new(0, 15, 0, 445)
ToggleBtn.Size = UDim2.new(1, -30, 0, 40)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "▶ START ENGINE SPAM"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 14
local btc = Instance.new("UICorner") btc.CornerRadius = UDim.new(0, 8) btc.Parent = ToggleBtn
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0, 495)
StatusLabel.Size = UDim2.new(1, 0, 0, 18)
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.Text = "System Status: Standing By"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 12
local function SendChatMessage(msg)
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
local textChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
if textChannel then textChannel:SendAsync(msg) end
else
local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
if chatEvents then
local sayMessage = chatEvents:FindFirstChild("SayMessageRequest")
if sayMessage then sayMessage:FireServer(msg, "All") end
end
end
end

local BaseRoastTemplates = {
"🔮☄️ TMX MAI TOXIC KA %s 😝TAP KARKE BOL %s OP 🔮☄️",
"👑🔥 TMX %s GODZILA POWER SONIC BEEM UNLEASHED 1000% MAXIMUM DESTRUCTION OVERLOAD 🔥👑",
"🦍⚡ tmx %s SUPER ULTRA BRAZIL TIGER GORILLA PUNCH CRUSHING THE WHOLE SERVER ⚡🦍",
"💥☀️ tmx %s MEGA POWER WAVE TSUNAMI BLAST ACTIVATED ACROSS ALL DIMENSIONS ☀️💥",
"🦁🐉 tmx %s ULTIMATE APEX PREDATOR MODE: DRAGON RAGE COMBINED WITH TIGER SPEED 🐉🦁",
"☄️🦾 tmx %s CYBERNETIC HYPER BEAM: OBLITERATING ALL OPPONENTS IN ONE TAP 🦾☄️",
"👑💥 tmx %s SUPREME OVERLORD UNLEASHING 9999X INTERGALACTIC PLASMA EXPLOSION DIRECTLY ON YOUR HEAD 💥👑",
"⚡🐉 tmx %s ELECTRIC DRAGON EMBERS BURNING THROUGH ENTIRE LOBBY WITH MAXIMUM VOLTAGE ENERGY ⚡🐉",
"🦾🔥 tmx %s CYBER MECHA GODZILA LASER CANNON SHORT-CIRCUITING YOUR WHOLE DEVICE FPS TO ZERO 🔥🦾",
"👑🔥 tmx %s SUPREME DIMENSIONAL RULER SUMMONING THE ANCIENT GODZILA FURY TO WIPE THE MAP CLEAN 🔥👑",
"⚡🌀 tmx %s QUANTUM TIME-WARP VORTEX SUCKING ALL YOUR SKILLS AND FPS INTO THE DEEP VOID 🌀⚡"
}
local SpamLoop = nil
local IsSpamming = false
ToggleBtn.MouseButton1Click:Connect(function()
if not IsSpamming then
local TargetsList = {}
for _, box in ipairs(TargetsTextBoxesList) do
if box.Text ~= "" and box.Text ~= " " then table.insert(TargetsList, box.Text) end
end
if #TargetsList == 0 then
StatusLabel.Text = "❌ Provide 1+ Target Identities!"
StatusLabel.TextColor3 = Color3.fromRGB(255, 65, 65)
return
end
local currentCustomName = "AYANUU"
if YourNameInput.Text ~= "" and YourNameInput.Text ~= " " then currentCustomName = YourNameInput.Text end
local DynamicRoastLines = {}
for _, template in ipairs(BaseRoastTemplates) do
table.insert(DynamicRoastLines, string.gsub(template, "%%s", currentCustomName))
end
IsSpamming = true
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 45, 45)
ToggleBtn.Text = "🛑 KILL ENGINE SPAM"
StatusLabel.Text = "🚀 Spam Server Active (" .. #TargetsList .. " Linked)"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
SpamLoop = task.spawn(function()
local lineIndex = 1
local targetIndex = 1
local paddingIndex = 1
while IsSpamming do
local CurrentTarget = TargetsList[targetIndex]
local CurrentLine = DynamicRoastLines[lineIndex]
if CustomMsgInput.Text ~= "" then CurrentLine = " " .. CustomMsgInput.Text end
local SelectedPadding = ""
if usePadding then
if autoPadding then SelectedPadding = PaddingsList[paddingIndex] .. " " else SelectedPadding = PaddingsList[manualPaddingIndex] .. " " end
end
SendChatMessage(SelectedPadding .. "[" .. CurrentTarget .. "]" .. CurrentLine)
if usePadding and autoPadding then
paddingIndex = paddingIndex + 1
if paddingIndex > #PaddingsList then paddingIndex = 1 end
end
if CustomMsgInput.Text == "" then
lineIndex = lineIndex + 1
if lineIndex > #DynamicRoastLines then lineIndex = 1 end
end
targetIndex = targetIndex + 1
if targetIndex > #TargetsList then targetIndex = 1 end
task.wait(UserDefinedDelay)
end
end)
else
IsSpamming = false
if SpamLoop then task.cancel(SpamLoop) SpamLoop = nil end
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
ToggleBtn.Text = "▶ START ENGINE SPAM"
StatusLabel.Text = "System Status: Stopped Safely"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
end
end)
print("Premium Glassmorphism Target Spammer V6.0 Injection Complete!")
