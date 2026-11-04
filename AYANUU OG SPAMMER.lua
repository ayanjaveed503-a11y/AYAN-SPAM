-- Delta Multi Player Spammer + Premium Action Side Panel
-- MADE BY AYANUU (Interactive Thick Dashboard V5.1 - Updated)

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local BackgroundImage = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local ImageCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local BtnCorner = Instance.new("UICorner")
local StatusLabel = Instance.new("TextLabel")

-- Toggle Button
local ToggleCircle = Instance.new("TextButton")
local CircleCorner = Instance.new("UICorner")

-- Toggles for Padding Configuration
local PaddingToggleBtn = Instance.new("TextButton")
local AutoToggleBtn = Instance.new("TextButton")

-- Manual Selectors Container Frame
local ManualContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- Anti-AFK & Anti-Fling Toggles
local AntiAfkToggleBtn = Instance.new("TextButton")
local AntiFlingToggleBtn = Instance.new("TextButton")

-- Dynamic Scrolling Setup
local TargetsScrollingFrame = Instance.new("ScrollingFrame")
local TargetsListLayout = Instance.new("UIListLayout")

-- Interactive Dialog Framework Elements
local DialogFrame = Instance.new("Frame")
local DialogLabel = Instance.new("TextLabel")
local YesBtn = Instance.new("TextButton")
local NoBtn = Instance.new("TextButton")

local antiAfkActive = true
local antiFlingActive = true
local TargetsTextBoxesList = {} 

local PaddingsList = {
    " ______________________________________________________________", 
    " - _ - _ - _ - _ - _ - _ - _ - _ - _ - _-- _ - _ - _ - _ - _ - ", 
    " o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|o_O|",         
    " (!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)(!)", 
    " @=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=@=" 
}

-- Main Frame Panel Setup
MainFrame.Name = "AyanMultiTargetSpammer"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.12, 0, 0.08, 0)
MainFrame.Size = UDim2.new(0, 330, 0, 580) 
MainFrame.Active = true
MainFrame.Draggable = true
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- ==========================================
-- 👑 SIDE PANEL ATTACHMENT SYSTEM 👑
-- ==========================================
local SidePanel = Instance.new("Frame")
local SideCorner = Instance.new("UICorner")
local SideTitle = Instance.new("TextLabel")
local SearchBar = Instance.new("TextBox")
local PlayerScroll = Instance.new("ScrollingFrame")
local PlayerListLayout = Instance.new("UIListLayout")
local CmdScroll = Instance.new("ScrollingFrame")
local CmdListLayout = Instance.new("UIListLayout")

SidePanel.Name = "AyanSidePanel"
SidePanel.Parent = MainFrame -- Attached directly to MainFrame so it stays chipka hua
SidePanel.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
SidePanel.Position = UDim2.new(1, 5, 0, 0) -- Exactly next to the main frame with 5px gap
SidePanel.Size = UDim2.new(0, 220, 1, 0)
SidePanel.BorderSizePixel = 0

SideCorner.CornerRadius = UDim.new(0, 12)
SideCorner.Parent = SidePanel

SideTitle.Name = "SideTitle"
SideTitle.Parent = SidePanel
SideTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
SideTitle.Size = UDim2.new(1, 0, 0, 30)
SideTitle.Font = Enum.Font.SourceSansBold
SideTitle.Text = "⚡ TARGET UTILITIES ⚡"
SideTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SideTitle.TextSize = 13
local SideTitleCorner = Instance.new("UICorner")
SideTitleCorner.CornerRadius = UDim.new(0, 12)
SideTitleCorner.Parent = SideTitle

SearchBar.Name = "SearchBar"
SearchBar.Parent = SidePanel
SearchBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SearchBar.Position = UDim2.new(0, 10, 0, 38)
SearchBar.Size = UDim2.new(1, -20, 0, 26)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.PlaceholderText = "🔍 Search Player..."
SearchBar.Text = ""
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.TextSize = 12
local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBar

PlayerScroll.Name = "PlayerScroll"
PlayerScroll.Parent = SidePanel
PlayerScroll.BackgroundTransparency = 1
PlayerScroll.Position = UDim2.new(0, 10, 0, 70)
PlayerScroll.Size = UDim2.new(1, -20, 0, 180)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.ScrollBarThickness = 3

PlayerListLayout.Parent = PlayerScroll
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerListLayout.Padding = UDim.new(0, 4)

CmdScroll.Name = "CmdScroll"
CmdScroll.Parent = SidePanel
CmdScroll.BackgroundTransparency = 1
CmdScroll.Position = UDim2.new(0, 10, 0, 260)
CmdScroll.Size = UDim2.new(1, -20, 0, 310)
CmdScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
CmdScroll.ScrollBarThickness = 3

CmdListLayout.Parent = CmdScroll
CmdListLayout.SortOrder = Enum.SortOrder.LayoutOrder
CmdListLayout.Padding = UDim.new(0, 5)

-- Global Neon Spectrum Loop for both Panels
task.spawn(function()
    local hue = 0
    while task.wait(0.03) do
        hue = hue + 1
        if hue > 360 then hue = 0 end
        local rgbColor = Color3.fromHSV(hue/360, 1, 1)
        MainFrame.BorderColor3 = rgbColor
        SidePanel.BorderColor3 = rgbColor
        Title.TextColor3 = rgbColor
        SideTitle.TextColor3 = rgbColor
        ToggleCircle.BackgroundColor3 = rgbColor
    end
end)

-- GUI Protection for Delta
if syn and syn.protect_gui then syn.protect_gui(ScreenGui)
elseif getgenv and getgenv().protect_gui then getgenv().protect_gui(ScreenGui) end
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- GOL TOGGLE BUTTON
ToggleCircle.Name = "ToggleCircle"
ToggleCircle.Parent = ScreenGui
ToggleCircle.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
ToggleCircle.Position = UDim2.new(0, 10, 0.5, -20)
ToggleCircle.Size = UDim2.new(0, 45, 0, 45)
ToggleCircle.Font = Enum.Font.SourceSansBold
ToggleCircle.Text = "💀"
ToggleCircle.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle.TextSize = 22
ToggleCircle.Active = true
ToggleCircle.Draggable = true
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = ToggleCircle

-- Background Layer Image Load
BackgroundImage.Name = "GUIBackground"
BackgroundImage.Parent = MainFrame
BackgroundImage.BackgroundTransparency = 0
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Image = "rbxassetid://13414163456"
BackgroundImage.ImageTransparency = 0.85
BackgroundImage.ScaleType = Enum.ScaleType.Crop
ImageCorner.CornerRadius = UDim.new(0, 12)
ImageCorner.Parent = BackgroundImage

ToggleCircle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Title Header Text
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Title.BackgroundTransparency = 0.3
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "👑 MADE BY AYANUU 👑"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.ZIndex = 2
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- Scrolling Container Panel Configuration
TargetsScrollingFrame.Name = "TargetsScrollingFrame"
TargetsScrollingFrame.Parent = MainFrame
TargetsScrollingFrame.BackgroundTransparency = 1
TargetsScrollingFrame.Position = UDim2.new(0, 15, 0, 38)
TargetsScrollingFrame.Size = UDim2.new(1, -30, 0, 100) 
TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
TargetsScrollingFrame.ScrollBarThickness = 4
TargetsScrollingFrame.ZIndex = 2

TargetsListLayout.Parent = TargetsScrollingFrame
TargetsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TargetsListLayout.Padding = UDim.new(0, 4)

local function TriggerInteractiveQuestion()
    DialogFrame.Visible = true
end

-- Core single line slot factory function
local function CreateDynamicTargetRow(optionalText)
    local RowFrame = Instance.new("Frame")
    local NewBox = Instance.new("TextBox")
    local BoxCorner = Instance.new("UICorner")
    local DeleteBtn = Instance.new("TextButton")
    local DelCorner = Instance.new("UICorner")

    RowFrame.Name = "TargetRow"
    RowFrame.Size = UDim2.new(1, 0, 0, 24)
    RowFrame.BackgroundTransparency = 1
    RowFrame.Parent = TargetsScrollingFrame
    RowFrame.ZIndex = 2

    NewBox.Name = "InputBox"
    NewBox.Parent = RowFrame
    NewBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    NewBox.BackgroundTransparency = 0.2
    NewBox.Size = UDim2.new(1, -28, 1, 0)
    NewBox.Font = Enum.Font.SourceSans
    NewBox.PlaceholderText = "Type target name..."
    NewBox.Text = optionalText or ""
    NewBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    NewBox.TextSize = 12
    NewBox.ZIndex = 3
    BoxCorner.CornerRadius = UDim.new(0, 4)
    BoxCorner.Parent = NewBox

    DeleteBtn.Name = "DeleteBtn"
    DeleteBtn.Parent = RowFrame
    DeleteBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    DeleteBtn.Position = UDim2.new(1, -24, 0, 0)
    DeleteBtn.Size = UDim2.new(0, 24, 1, 0)
    DeleteBtn.Font = Enum.Font.SourceSansBold
    DeleteBtn.Text = "❌"
    DeleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DeleteBtn.TextSize = 9
    DeleteBtn.ZIndex = 3
    DelCorner.CornerRadius = UDim.new(0, 4)
    DelCorner.Parent = DeleteBtn

    table.insert(TargetsTextBoxesList, NewBox)
    TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TargetsListLayout.AbsoluteContentSize.Y)
    
    NewBox.FocusLost:Connect(function(enterPressed)
        if NewBox.Text ~= "" and NewBox.Text ~= " " then
            TriggerInteractiveQuestion()
        end
    end)
    
    DeleteBtn.MouseButton1Click:Connect(function()
        for idx, trackedBox in ipairs(TargetsTextBoxesList) do
            if trackedBox == NewBox then
                table.remove(TargetsTextBoxesList, idx)
                break
            end
        end
        RowFrame:Destroy()
        task.wait(0.05)
			TargetsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TargetsListLayout.AbsoluteContentSize.Y)
end)
end
-- Dialog Frame Setup
DialogFrame.Name = "DialogFrame"
DialogFrame.Parent = MainFrame
DialogFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
DialogFrame.BackgroundTransparency = 0.1
DialogFrame.Position = UDim2.new(0, 15, 0, 145)
DialogFrame.Size = UDim2.new(1, -30, 0, 48)
DialogFrame.Visible = false
local dFCorner = Instance.new("UICorner") dFCorner.CornerRadius = UDim.new(0,5) dFCorner.Parent = DialogFrame
DialogLabel.Parent = DialogFrame
DialogLabel.BackgroundTransparency = 1
DialogLabel.Position = UDim2.new(0, 5, 0, 3)
DialogLabel.Size = UDim2.new(1, -10, 0, 18)
DialogLabel.Font = Enum.Font.SourceSansBold
DialogLabel.Text = "❓ Another target?"
DialogLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
DialogLabel.TextSize = 12
DialogLabel.ZIndex = 3
local function configureDialogButton(btn, text, pos, bgCol)
btn.Parent = DialogFrame
btn.BackgroundColor3 = bgCol
btn.Position = pos
btn.Size = UDim2.new(0, 135, 0, 20)
btn.Font = Enum.Font.SourceSansBold
btn.Text = text
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 11
btn.ZIndex = 3
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,3) c.Parent = btn
end
configureDialogButton(YesBtn, "✔ YES (Add More)", UDim2.new(0, 8, 0, 23), Color3.fromRGB(40, 140, 40))
configureDialogButton(NoBtn, "❌ NO (Done)", UDim2.new(0, 152, 0, 23), Color3.fromRGB(140, 40, 40))
YesBtn.MouseButton1Click:Connect(function()
CreateDynamicTargetRow()
StatusLabel.Text = "Status: New input slot added!"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
end)
NoBtn.MouseButton1Click:Connect(function()
DialogFrame.Visible = false
StatusLabel.Text = "Status: Targets list saved."
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
end)
CreateDynamicTargetRow()
local function CreateTextBox(placeholder, pos)
local box = Instance.new("TextBox")
box.Parent = MainFrame
box.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
box.BackgroundTransparency = 0.2
box.Position = pos
box.Size = UDim2.new(1, -30, 0, 24)
box.Font = Enum.Font.SourceSans
box.PlaceholderText = placeholder
box.Text = ""
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.TextSize = 12
box.ZIndex = 2
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 4)
corner.Parent = box
return box
end
local YourNameInput = CreateTextBox("Type Your Name (Default: AYANUU)...", UDim2.new(0, 15, 0, 200))
YourNameInput.PlaceholderColor3 = Color3.fromRGB(255, 215, 0)
local CustomMsgInput = CreateTextBox("Type Custom Message...", UDim2.new(0, 15, 0, 230))
CustomMsgInput.PlaceholderColor3 = Color3.fromRGB(0, 255, 255)
local FastBtn = Instance.new("TextButton")
local SlowBtn = Instance.new("TextButton")
local UserDefinedDelay = 2.5
local function setupSpeedBtn(btn, text, pos)
btn.Parent = MainFrame
btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
btn.Position = pos
btn.Size = UDim2.new(0, 142, 0, 24)
btn.Font = Enum.Font.SourceSansBold
btn.Text = text
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
btn.ZIndex = 2
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,4) c.Parent = btn
end
setupSpeedBtn(FastBtn, "⚡ FAST MODE", UDim2.new(0, 15, 0, 260))
setupSpeedBtn(SlowBtn, "🐢 SLOW MODE", UDim2.new(0, 172, 0, 260))
FastBtn.MouseButton1Click:Connect(function()
UserDefinedDelay = 0.4
FastBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
SlowBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
end)
-- Continuation of Button Configuration
SlowBtn.MouseButton1Click:Connect(function()
UserDefinedDelay = 4.0
SlowBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
FastBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
end)

local usePadding = true
local autoPadding = true
local manualPaddingIndex = 5
PaddingToggleBtn.Parent = MainFrame
PaddingToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
PaddingToggleBtn.Position = UDim2.new(0, 15, 0, 290)
PaddingToggleBtn.Size = UDim2.new(0, 142, 0, 24)
PaddingToggleBtn.Font = Enum.Font.SourceSansBold
PaddingToggleBtn.Text = "Padding: ON"
PaddingToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PaddingToggleBtn.TextSize = 11
PaddingToggleBtn.ZIndex = 2
local pCorner = Instance.new("UICorner") pCorner.CornerRadius = UDim.new(0,4) pCorner.Parent = PaddingToggleBtn
PaddingToggleBtn.MouseButton1Click:Connect(function()
usePadding = not usePadding
PaddingToggleBtn.BackgroundColor3 = usePadding and Color3.fromRGB(40, 180, 40) or Color3.fromRGB(180, 40, 40)
PaddingToggleBtn.Text = usePadding and "Padding: ON" or "Padding: OFF"
end)
AutoToggleBtn.Parent = MainFrame
AutoToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
AutoToggleBtn.Position = UDim2.new(0, 172, 0, 290)
AutoToggleBtn.Size = UDim2.new(0, 142, 0, 24)
AutoToggleBtn.Font = Enum.Font.SourceSansBold
AutoToggleBtn.Text = "Auto Pad: ON"
AutoToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoToggleBtn.TextSize = 11
AutoToggleBtn.ZIndex = 2
local aCorner = Instance.new("UICorner") aCorner.CornerRadius = UDim.new(0,4) aCorner.Parent = AutoToggleBtn
AutoToggleBtn.MouseButton1Click:Connect(function()
autoPadding = not autoPadding
AutoToggleBtn.BackgroundColor3 = autoPadding and Color3.fromRGB(40, 180, 40) or Color3.fromRGB(180, 40, 40)
AutoToggleBtn.Text = autoPadding and "Auto Pad: ON" or "Auto Pad: OFF"
ManualContainer.Visible = not autoPadding
end)
ManualContainer.Name = "ManualContainer"
ManualContainer.Parent = MainFrame
ManualContainer.BackgroundTransparency = 1
ManualContainer.Position = UDim2.new(0, 15, 0, 320)
ManualContainer.Size = UDim2.new(1, -30, 0, 24)
ManualContainer.Visible = false
UIListLayout.Parent = ManualContainer
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
local SelectorButtons = {}
local paddingLabels = {"__", "--", "o_O", "(!)", "@="}
for i, label in ipairs(paddingLabels) do
local btn = Instance.new("TextButton")
btn.Parent = ManualContainer
btn.BackgroundColor3 = (i == manualPaddingIndex) and Color3.fromRGB(220, 50, 50) or Color3.fromRGB(45, 45, 50)
btn.Size = UDim2.new(0, 56, 1, 0)
btn.Font = Enum.Font.SourceSansBold
btn.Text = label
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 11
btn.ZIndex = 2
local bC = Instance.new("UICorner") bC.CornerRadius = UDim.new(0,3) bC.Parent = btn
SelectorButtons[i] = btn
btn.MouseButton1Click:Connect(function()
manualPaddingIndex = i
for idx, b in ipairs(SelectorButtons) do
b.BackgroundColor3 = (idx == manualPaddingIndex) and Color3.fromRGB(220, 50, 50) or Color3.fromRGB(45, 45, 50)
end
end)
end
setupSpeedBtn(AntiAfkToggleBtn, "🛡️ ANTI-AFK: ON", UDim2.new(0, 15, 0, 350))
setupSpeedBtn(AntiFlingToggleBtn, "🛡️ ANTI-FLING: ON", UDim2.new(0, 172, 0, 350))
AntiAfkToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
AntiFlingToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)

-- ==========================================
-- 🛡️ ANTI-AFK & ANTI-FLING LOGIC 🛡️
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
if CoreGui:FindFirstChild("AYANUU_AFK_Timer") then
CoreGui.AYANUU_AFK_Timer:Destroy()
end
AfkScreenGui = Instance.new("ScreenGui")
AfkScreenGui.Name = "AYANUU_AFK_Timer"
AfkScreenGui.ResetOnSpawn = false
AfkScreenGui.Parent = CoreGui
local AfkMainFrame = Instance.new("Frame")
AfkMainFrame.Size = UDim2.new(0, 260, 0, 185)
AfkMainFrame.Position = UDim2.new(0.5, -130, 0.5, -92)
AfkMainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
AfkMainFrame.BorderSizePixel = 0
AfkMainFrame.ClipsDescendants = true
AfkMainFrame.Active = true
AfkMainFrame.Draggable = true
AfkMainFrame.Parent = AfkScreenGui
local MainCorner = Instance.new("UICorner", AfkMainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", AfkMainFrame)
MainStroke.Color = Color3.fromRGB(100, 15, 15)
MainStroke.Thickness = 1.5
local RainContainer = Instance.new("Frame", AfkMainFrame)
RainContainer.Size = UDim2.new(1, 0, 1, 0)
RainContainer.BackgroundTransparency = 1
local function SpawnRainDrop()
if not AfkMainFrame or not AfkMainFrame.Parent then return end
local drop = Instance.new("Frame")
local startX = math.random(0, 260)
local dropLength = math.random(10, 20)
local dropSpeed = math.random(6, 12) / 10
drop.Size = UDim2.new(0, 2, 0, dropLength)
drop.Position = UDim2.new(0, startX, 0, -dropLength)
drop.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
drop.BackgroundTransparency = math.random(3, 6) / 10
drop.BorderSizePixel = 0
drop.Parent = RainContainer
local gradient = Instance.new("UIGradient", drop)
gradient.Rotation = 90
gradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 60)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 0))
}
local tween = TweenService:Create(drop, TweenInfo.new(dropSpeed, Enum.EasingStyle.Linear), {
Position = UDim2.new(0, startX - math.random(8, 15), 1, dropLength)
})
tween:Play()
tween.Completed:Connect(function() drop:Destroy() end)
end
task.spawn(function()
while AfkMainFrame and AfkMainFrame.Parent do
SpawnRainDrop()
task.wait(0.05)
end
end)
local Header = Instance.new("Frame", AfkMainFrame)
Header.BackgroundTransparency = 1
Header.Position = UDim2.new(0, 0, 0, 10)
Header.Size = UDim2.new(1, 0, 0, 30)
Header.ZIndex = 2
local UserImage = Instance.new("ImageLabel", Header)
UserImage.BackgroundTransparency = 1
UserImage.Position = UDim2.new(0, 12, 0, 0)
UserImage.Size = UDim2.new(0, 26, 0, 26)
UserImage.ZIndex = 2
Instance.new("UICorner", UserImage).CornerRadius = UDim.new(1, 0)
pcall(function()
UserImage.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)

local TitleLabel = Instance.new("TextLabel", Header)
TitleLabel.Size = UDim2.new(1, -45, 1, 0)
TitleLabel.Position = UDim2.new(0, 45, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "AYANUU AFK"
TitleLabel.TextColor3 = Color3.fromRGB(255, 40, 40)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 2

    local TimerLabel = Instance.new("TextLabel", AfkMainFrame)
    TimerLabel.Size = UDim2.new(1, 0, 0, 30)
    TimerLabel.Position = UDim2.new(0, 0, 0, 45)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.Text = "000:00:00"
    TimerLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
    TimerLabel.TextSize = 22
    TimerLabel.Font = Enum.Font.Code
    TimerLabel.ZIndex = 2

    local DayLabel = Instance.new("TextLabel", AfkMainFrame)
    DayLabel.Size = UDim2.new(1, 0, 0, 20)
    DayLabel.Position = UDim2.new(0, 0, 0, 75)
    DayLabel.BackgroundTransparency = 1
    DayLabel.Text = "day : 0"
    DayLabel.TextColor3 = Color3.fromRGB(220, 150, 150)
    DayLabel.TextSize = 14
    DayLabel.Font = Enum.Font.SourceSansBold
    DayLabel.ZIndex = 2

    local SavesLabel = Instance.new("TextLabel", AfkMainFrame)
    SavesLabel.Size = UDim2.new(1, 0, 0, 20)
    SavesLabel.Position = UDim2.new(0, 0, 0, 105)
    SavesLabel.BackgroundTransparency = 1
    SavesLabel.Text = "Kicks Prevented: 0"
    SavesLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    SavesLabel.TextSize = 13
    SavesLabel.Font = Enum.Font.SourceSansBold
    SavesLabel.ZIndex = 2

    local StatusLabelAFK = Instance.new("TextLabel", AfkMainFrame)
    StatusLabelAFK.Size = UDim2.new(1, 0, 0, 20)
    StatusLabelAFK.Position = UDim2.new(0, 0, 0, 135)
    StatusLabelAFK.BackgroundTransparency = 1
    StatusLabelAFK.Text = "Anti-AFK: Active"
    StatusLabelAFK.TextColor3 = Color3.fromRGB(80, 220, 80)
    StatusLabelAFK.TextSize = 12
    StatusLabelAFK.Font = Enum.Font.SourceSansBold
    StatusLabelAFK.ZIndex = 2

    local startTime = tick()

    task.spawn(function()
        while AfkScreenGui and AfkScreenGui.Parent do
            local elapsedTime = tick() - startTime
            local hours = math.floor(elapsedTime / 3600)
            local minutes = math.floor((elapsedTime % 3600) / 60)
            local seconds = math.floor(elapsedTime % 60)
            local days = math.floor(elapsedTime / 86400)
            
            TimerLabel.Text = string.format("%03d:%02d:%02d", hours, minutes, seconds)
            DayLabel.Text = "day : " .. days
            
            task.wait(1)
        end
    end)
end

local function RemoveAfkGui()
    if CoreGui:FindFirstChild("AYANUU_AFK_Timer") then
        CoreGui.AYANUU_AFK_Timer:Destroy()
    end
end

CreateAfkGui()

p.Idled:Connect(function()
    if antiAfkActive then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new(0, 0))
        pcall(function()
            if p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

AntiAfkToggleBtn.MouseButton1Click:Connect(function()
    antiAfkActive = not antiAfkActive
    AntiAfkToggleBtn.BackgroundColor3 = antiAfkActive and Color3.fromRGB(40, 180, 40) or Color3.fromRGB(180, 40, 40)
    AntiAfkToggleBtn.Text = antiAfkActive and "🛡️ ANTI-AFK: ON" or "🛡️ ANTI-AFK: OFF"
    if antiAfkActive then CreateAfkGui() else RemoveAfkGui() end
end)

-- Anti Fling Setup
local connections = {}
local DetectionRadius = 25
local MaxSafeVelocity = 80

local antiFlingScreenGui = Instance.new("ScreenGui")
antiFlingScreenGui.Name = "AntiFlingIndicator"
antiFlingScreenGui.ResetOnSpawn = false
antiFlingScreenGui.Parent = CoreGui

local statusLabelFling = Instance.new("TextButton")
statusLabelFling.Size = UDim2.new(0, 200, 0, 30)
statusLabelFling.Position = UDim2.new(0, 15, 1, -45)
statusLabelFling.BackgroundTransparency = 1
statusLabelFling.Text = "Anti-Fling & Ring: Enabled"
statusLabelFling.TextColor3 = Color3.fromRGB(0, 255, 140)
statusLabelFling.TextSize = 16
statusLabelFling.Font = Enum.Font.SourceSansBold
statusLabelFling.TextXAlignment = Enum.TextXAlignment.Left
statusLabelFling.Parent = antiFlingScreenGui

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 1.5
uiStroke.Color = Color3.fromRGB(0, 0, 0)
uiStroke.Parent = statusLabelFling

local function updateAntiFlingUI()
	if antiFlingActive then
		statusLabelFling.Text = "Anti-Fling & Ring: Enabled"
		statusLabelFling.TextColor3 = Color3.fromRGB(0, 255, 140)
	else
		statusLabelFling.Text = "Anti-Fling & Ring: Disabled"
		statusLabelFling.TextColor3 = Color3.fromRGB(255, 80, 80)
	end
end

local function setupCharacterCollision(character)
	local function disableCollide(part)
		if antiFlingActive and part:IsA("BasePart") then part.CanCollide = false end
	end
	for _, part in ipairs(character:GetChildren()) do disableCollide(part) end
	local childAddedConn = character.ChildAdded:Connect(disableCollide)
	local steppedConn = RunService.Stepped:Connect(function()
		if antiFlingActive and character:IsDescendantOf(Workspace) then
			for _, part in ipairs(character:GetChildren()) do
				if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
			end
		end
	end)
	character.Destroying:Connect(function()
		childAddedConn:Disconnect()
		steppedConn:Disconnect()
	end)
end

local function trackPlayer(player)
	if player == p then return end
	local charAddedConn = player.CharacterAdded:Connect(setupCharacterCollision)
	if player.Character then setupCharacterCollision(player.Character) end
	connections[player] = charAddedConn
end

local function untrackPlayer(player)
	if connections[player] then
		connections[player]:Disconnect()
		connections[player] = nil
	end
end

for _, player in ipairs(Players:GetPlayers()) do trackPlayer(player) end
Players.PlayerAdded:Connect(trackPlayer)
Players.PlayerRemoving:Connect(untrackPlayer)

AntiFlingToggleBtn.MouseButton1Click:Connect(function()
	antiFlingActive = not antiFlingActive
	updateAntiFlingUI()
	AntiFlingToggleBtn.BackgroundColor3 = antiFlingActive and Color3.fromRGB(40, 180, 40) or Color3.fromRGB(180, 40, 40)
	AntiFlingToggleBtn.Text = antiFlingActive and "🛡️ ANTI-FLING: ON" or "🛡️ ANTI-FLING: OFF"
end)

-- ==========================================
-- 🛡️ SIDE PANEL FEATURE PROCESSORS 🛡️
-- ==========================================
local ActiveSideTarget = ""
local CurrentLoopRoutine = nil

local function ClearActiveLoops()
    if CurrentLoopRoutine then 
        task.cancel(CurrentLoopRoutine) 
        CurrentLoopRoutine = nil 
    end
    workspace.CurrentCamera.CameraSubject = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
end

local function GetTargetCharacter()
    if ActiveSideTarget == "" then return nil end
    local targetPlr = Players:FindFirstChild(ActiveSideTarget)
    if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then
        return targetPlr.Character, targetPlr
    end
    return nil
end

local function InitBangProcess(offsetY, velocityMultiplier)
    ClearActiveLoops()
    CurrentLoopRoutine = task.spawn(function()
        while task.wait() do
            local char = GetTargetCharacter()
            if char and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local tHrp = char.HumanoidRootPart
                local myHrp = p.Character.HumanoidRootPart
                for i = 1, 10 do
                    myHrp.CFrame = tHrp.CFrame * CFrame.new(0, offsetY, 1 + (i * 0.1))
                    task.wait(0.02)
                end
            end
        end
    end)
end

local function InitAttachmentMode(offset)
    ClearActiveLoops()
    CurrentLoopRoutine = task.spawn(function()
        while task.wait() do
            local char = GetTargetCharacter()
            if char and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                p.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * offset
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
        hl.FillColor = Color3.fromRGB(255, 0, 0)
        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
        hl.Parent = char
    end
end

-- ==========================================
-- 🛠️ SIDE PANEL BUTTON POPULATION 🛠️
-- ==========================================
local CommandsList = {
    {name = "💥 Bang", action = function() InitBangProcess(0, 1) end},
    {name = "👄 Mouthbang", action = function() InitBangProcess(1.2, 1) end},
    {name = "🧑‍🦼 Headsit", action = function() InitAttachmentMode(CFrame.new(0, 2.5, 0)) end},
    {name = "🧘 Backsit", action = function() InitAttachmentMode(CFrame.new(0, 1, 1)) end},
    {name = "🌀 Orbit", action = TriggerOrbitMode},
    {name = "👁️ View", action = function() 
        local char = GetTargetCharacter()
        if char and char:FindFirstChildOfClass("Humanoid") then
            workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
        end
    end},
    {name = "📌 ESP", action = ApplyEspHighlight},
    {name = "🛑 STOP ALL", action = function()
        ClearActiveLoops()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("AyanHighlight") then
                plr.Character.AyanHighlight:Destroy()
            end
        end
    end}
}

for _, cmd in ipairs(CommandsList) do
    local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 28)
btn.BackgroundColor3 = cmd.name == "🛑 STOP ALL" and Color3.fromRGB(180, 40, 40) or Color3.fromRGB(40, 40, 52)
btn.Font = Enum.Font.SourceSansBold
btn.Text = cmd.name
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
btn.Parent = CmdScroll
local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 5) c.Parent = btn
btn.MouseButton1Click:Connect(cmd.action)
end
CmdScroll.CanvasSize = UDim2.new(0, 0, 0, CmdListLayout.AbsoluteContentSize.Y)
local function RebuildPlayerListGrid()
for _, item in ipairs(PlayerScroll:GetChildren()) do
if item:IsA("TextButton") then item:Destroy() end
end
local filterText = SearchBar.Text:lower()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= p and (filterText == "" or plr.Name:lower():find(filterText) or plr.DisplayName:lower():find(filterText)) then
local pBtn = Instance.new("TextButton")
pBtn.Size = UDim2.new(1, 0, 0, 24)
pBtn.BackgroundColor3 = (ActiveSideTarget == plr.Name) and Color3.fromRGB(220, 50, 50) or Color3.fromRGB(30, 30, 38)
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
SearchBar.Changed:Connect(function(prop)
if prop == "Text" then RebuildPlayerListGrid() end
end)
Players.PlayerAdded:Connect(RebuildPlayerListGrid)
Players.PlayerRemoving:Connect(RebuildPlayerListGrid)
task.spawn(RebuildPlayerListGrid)
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
ToggleBtn.Position = UDim2.new(0, 15, 0, 425)
ToggleBtn.Size = UDim2.new(1, -30, 0, 36)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "▶ START SPAM"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 14
ToggleBtn.ZIndex = 2
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = ToggleBtn
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0, 468)
StatusLabel.Size = UDim2.new(1, 0, 0, 18)
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.Text = "Status: Idle"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 11
StatusLabel.ZIndex = 2
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
task.spawn(function()
task.wait(1)
SendChatMessage("(!)(!)(!)⚠️AYANUU OG SPAMMER LOADED...⚠️(!)(!)(!)")
end)
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
"⚡🌀 tmx %s QUANTUM TIME-WARP VORTEX SUCKING ALL YOUR SKILLS AND FPS INTO THE DEEP VOID 🌀⚡",
"🦾💥 tmx %s UNSTOPPABLE CYBERNETIC APOCALYPSE CRUSHING EVERY OPPONENT WITH 1000000X FORCE 💥🦾",
"🐉⭐ tmx %s LEGENDARY DRAGON OVERLORD ASCENSION: THE ENTIRE LOBBY BOWS TO THE TRUE KING ⭐🐉",
"🌪️🌊 tmx %s CATEGORY 10 TITAN HURRICANE WIPING OUT EVERY SINGLE PLAYER IN FRACTION OF A SECOND 🌊🌪️",
"☄️🥊 tmx %s HYPER SONIC METEOR STRIKE COMBINED WITH JUNGLE KINGDOM FURY CRUSHING ALL DEFENSES 🥊☄️",
"🌋☀️ tmx %s MOLTEN MAGMA TSUNAMI FLOODING THE ENTIRE DIMENSION WITH UNSTOPPABLE HEAT PULSE ☀️🌋",
"🗿👑 tmx %s THE UNDEFEATED EMPEROR STEPPING INTO THE MAP: EVERYONE KNEEL BEFORE THE REAL %s 👑🗿",
"👑⭐ tmx %s GOD-TIER OVERLORD PULSE: BOW DOWN TO THE ONE AND ONLY REAL %s ⭐👑",
"🏆🥊 tmx %s UNSTOPPABLE KNOCKOUT FURY SHATTERING ALL SOUND BARRIERS CONTINUOUSLY 🏆🥊"
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
StatusLabel.Text = "❌ Write at least 1 valid name!"
StatusLabel.TextColor3 = Color3.fromRGB(255, 65, 65)
return
end
local currentCustomName = "AYANUU"
if YourNameInput.Text ~= "" and YourNameInput.Text ~= " " then currentCustomName = YourNameInput.Text end
local DynamicRoastLines = {}
for _, template in ipairs(BaseRoastTemplates) do
local formatted = string.gsub(template, "%%s", currentCustomName)
table.insert(DynamicRoastLines, formatted)
end
IsSpamming = true
ToggleBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
ToggleBtn.Text = "🛑 STOP SPAM"
StatusLabel.Text = "⚡ Active (" .. #TargetsList .. " Targets)"
StatusLabel.TextColor3 = Color3.fromRGB(65, 255, 65)
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
local FinalFormattedMessage = SelectedPadding .. "[" .. CurrentTarget .. "]" .. CurrentLine
SendChatMessage(FinalFormattedMessage)
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
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
ToggleBtn.Text = "▶ START SPAM"
StatusLabel.Text = "Status: Stopped"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
end
end)
print("AYAN Conversational Thick Target Edition V5.1 Loaded with Premium Action Side Panel!")
