--[[
    🎃 HALLOWEEN RAINBOW EDITION 🎃
    PRIVATE SERVER FINDER
    Credit: ahmadcihuy
]]

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- GUI CREATION
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PrivateServerFinder"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game.CoreGui
end

-- 🎃 HALLOWEEN INTRO
local Intro = Instance.new("Frame")
Intro.Name = "HalloweenIntro"
Intro.Parent = ScreenGui
Intro.Size = UDim2.new(1, 0, 1, 0)
Intro.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
Intro.BackgroundTransparency = 0.08
Intro.BorderSizePixel = 0
Intro.ZIndex = 100

local Logo = Instance.new("TextLabel")
Logo.Parent = Intro
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.Position = UDim2.new(0.5, 0, 0.43, 0)
Logo.Size = UDim2.new(0, 320, 0, 90)
Logo.BackgroundTransparency = 1
Logo.Font = Enum.Font.FredokaOne
Logo.Text = "🎃 👻 🎃\nAHMADCIHUY"
Logo.TextSize = 29
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextStrokeTransparency = 0
Logo.TextStrokeColor3 = Color3.fromRGB(130, 0, 255)
Logo.ZIndex = 101

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 80)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 140, 0)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 120)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 140, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(190, 0, 255))
})
LogoGradient.Parent = Logo

local IntroSubtitle = Instance.new("TextLabel")
IntroSubtitle.Parent = Intro
IntroSubtitle.AnchorPoint = Vector2.new(0.5, 0.5)
IntroSubtitle.Position = UDim2.new(0.5, 0, 0.54, 0)
IntroSubtitle.Size = UDim2.new(0, 300, 0, 25)
IntroSubtitle.BackgroundTransparency = 1
IntroSubtitle.Font = Enum.Font.GothamBold
IntroSubtitle.Text = "✦ HALLOWEEN RAINBOW EDITION ✦"
IntroSubtitle.TextSize = 12
IntroSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroSubtitle.ZIndex = 101

local IntroCredit = Instance.new("TextLabel")
IntroCredit.Parent = Intro
IntroCredit.AnchorPoint = Vector2.new(0.5, 0.5)
IntroCredit.Position = UDim2.new(0.5, 0, 0.59, 0)
IntroCredit.Size = UDim2.new(0, 250, 0, 22)
IntroCredit.BackgroundTransparency = 1
IntroCredit.Font = Enum.Font.GothamMedium
IntroCredit.Text = "👻 Credit: ahmadcihuy 🎃"
IntroCredit.TextSize = 11
IntroCredit.TextColor3 = Color3.fromRGB(200, 200, 220)
IntroCredit.ZIndex = 101

-- MAIN WINDOW
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -120)
MainFrame.Size = UDim2.new(0, 260, 0, 240)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 1

Instance.new("UICorner", MainFrame).CornerRadius =
    UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2

local BorderGradient = Instance.new("UIGradient")
BorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 80)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 200, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 120)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 120, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(190, 0, 255))
})
BorderGradient.Parent = UIStroke

-- HEADER
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Position = UDim2.new(0, 15, 0, 12)
Title.Size = UDim2.new(0, 195, 0, 18)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.FredokaOne
Title.Text = "🎃 SERVER FINDER"
Title.TextColor3 = Color3.fromRGB(255, 150, 50)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = MainFrame
Subtitle.Position = UDim2.new(0, 15, 0, 30)
Subtitle.Size = UDim2.new(0, 180, 0, 14)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.Text = "✦ by ahmadcihuy ✦"
Subtitle.TextColor3 = Color3.fromRGB(180, 150, 220)
Subtitle.TextSize = 10
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE BUTTON
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
CloseBtn.Position = UDim2.new(1, -32, 0, 12)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
CloseBtn.TextSize = 11

Instance.new("UICorner", CloseBtn).CornerRadius =
    UDim.new(0, 6)

-- STATUS CARD
local StatusCard = Instance.new("Frame")
StatusCard.Parent = MainFrame
StatusCard.Position = UDim2.new(0, 15, 0, 52)
StatusCard.Size = UDim2.new(1, -30, 0, 50)
StatusCard.BackgroundColor3 = Color3.fromRGB(24, 20, 40)
StatusCard.BorderSizePixel = 0

Instance.new("UICorner", StatusCard).CornerRadius =
    UDim.new(0, 8)

local NowLabel = Instance.new("TextLabel")
NowLabel.Parent = StatusCard
NowLabel.Position = UDim2.new(0, 10, 0, 6)
NowLabel.Size = UDim2.new(1, -20, 0, 18)
NowLabel.BackgroundTransparency = 1
NowLabel.Font = Enum.Font.GothamBold
NowLabel.Text = "🎃 Checking server..."
NowLabel.TextXAlignment = Enum.TextXAlignment.Left
NowLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
NowLabel.TextSize = 12

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusCard
StatusLabel.Position = UDim2.new(0, 10, 0, 24)
StatusLabel.Size = UDim2.new(1, -20, 0, 22)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "✦ Ready ✦"
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextColor3 = Color3.fromRGB(200, 180, 220)
StatusLabel.TextSize = 10
StatusLabel.TextWrapped = true

-- MAX PLAYER INPUT
local MaxBox = Instance.new("TextBox")
MaxBox.Parent = MainFrame
MaxBox.Position = UDim2.new(0, 15, 0, 110)
MaxBox.Size = UDim2.new(1, -30, 0, 32)
MaxBox.BackgroundColor3 = Color3.fromRGB(24, 20, 40)
MaxBox.BorderSizePixel = 0
MaxBox.Font = Enum.Font.GothamBold
MaxBox.Text = "1"
MaxBox.PlaceholderText = "Max Players Allowed"
MaxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxBox.TextSize = 13
MaxBox.ClearTextOnFocus = false

Instance.new("UICorner", MaxBox).CornerRadius =
    UDim.new(0, 8)

-- HOP BUTTON
local JoinBtn = Instance.new("TextButton")
JoinBtn.Parent = MainFrame
JoinBtn.Position = UDim2.new(0, 15, 0, 150)
JoinBtn.Size = UDim2.new(1, -30, 0, 34)
JoinBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
JoinBtn.BorderSizePixel = 0
JoinBtn.Font = Enum.Font.GothamBold
JoinBtn.Text = "🎃 HOP SERVER NOW"
JoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinBtn.TextSize = 11

Instance.new("UICorner", JoinBtn).CornerRadius =
    UDim.new(0, 8)

-- AUTO HOP BUTTON
local AutoBtn = Instance.new("TextButton")
AutoBtn.Parent = MainFrame
AutoBtn.Position = UDim2.new(0, 15, 0, 190)
AutoBtn.Size = UDim2.new(1, -30, 0, 34)
AutoBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
AutoBtn.BorderSizePixel = 0
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "👻 AUTO HOP: DISABLED"
AutoBtn.TextColor3 = Color3.fromRGB(180, 180, 200)
AutoBtn.TextSize = 10

Instance.new("UICorner", AutoBtn).CornerRadius =
    UDim.new(0, 8)

-- HOVER EFFECTS
local function addHover(btn, normalColor, hoverColor)
    btn.MouseEnter:Connect(function()
        TweenService:Create(
            btn,
            TweenInfo.new(0.2),
            {BackgroundColor3 = hoverColor}
        ):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(
            btn,
            TweenInfo.new(0.2),
            {BackgroundColor3 = normalColor}
        ):Play()
    end)
end

addHover(
    JoinBtn,
    Color3.fromRGB(0, 140, 255),
    Color3.fromRGB(30, 160, 255)
)

addHover(
    CloseBtn,
    Color3.fromRGB(35, 30, 50),
    Color3.fromRGB(220, 50, 70)
)

-- ANIMATIONS
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

task.spawn(function()
    while ScreenGui.Parent do
        LogoGradient.Rotation = (LogoGradient.Rotation + 3) % 360
        BorderGradient.Rotation = (BorderGradient.Rotation + 2) % 360
        task.wait(0.04)
    end
end)

-- INTRO FADE OUT
task.delay(3, function()
    if not Intro.Parent then
        return
    end

    local fadeInfo = TweenInfo.new(
        1.2,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )

    TweenService:Create(
        Intro,
        fadeInfo,
        {BackgroundTransparency = 1}
    ):Play()

    TweenService:Create(
        Logo,
        fadeInfo,
        {
            TextTransparency = 1,
            TextStrokeTransparency = 1
        }
    ):Play()

    TweenService:Create(
        IntroSubtitle,
        fadeInfo,
        {TextTransparency = 1}
    ):Play()

    TweenService:Create(
        IntroCredit,
        fadeInfo,
        {TextTransparency = 1}
    ):Play()

    task.wait(1.3)

    if Intro.Parent then
        Intro:Destroy()
    end
end)

-- SERVER STATUS
task.spawn(function()
    while ScreenGui.Parent do
        NowLabel.Text = "🎃 Current Server: "
            .. #Players:GetPlayers() .. " player(s)"
        task.wait(1)
    end
end)

-- SERVER SEARCH
local function getRandomServer()
    local url = "https://games.roblox.com/v1/games/"
        .. PlaceId
        .. "/servers/Public?sortOrder=Asc&limit=100"

    local ok, raw = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or not raw or raw == "" then
        return nil
    end

    local ok2, data = pcall(function()
        return HttpService:JSONDecode(raw)
    end)

    if not ok2 or not data or not data.data
        or #data.data == 0 then
        return nil
    end

    local candidates = {}
    local currentId = tostring(game.JobId)

    for _, server in ipairs(data.data) do
        if server.id
            and tostring(server.id) ~= currentId
            and server.playing
            and server.maxPlayers then

            table.insert(candidates, {
                id = tostring(server.id),
                playing = server.playing,
                maxPlayers = server.maxPlayers
            })
        end
    end

    if #candidates == 0 then
        return nil
    end

    return candidates[math.random(1, #candidates)]
end

-- HOP LOGIC
local autoEnabled = false
local autoThread = nil
local busy = false

local function joinOnce()
    if busy then
        return false
    end

    busy = true

    local threshold = math.max(
        1,
        math.floor(tonumber(MaxBox.Text) or 1)
    )

    local currentCount = #Players:GetPlayers()

    if currentCount <= threshold then
        StatusLabel.Text = "🎃 Server matches target!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 230, 150)
        busy = false
        return false
    end

    StatusLabel.Text = "🌈 Searching for server..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 50)

    task.wait(0.5)

    local server = getRandomServer()

    if not server then
        StatusLabel.Text = "👻 No server found. Try again."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        busy = false
        return false
    end

    if server.playing > threshold then
        StatusLabel.Text = "Searching for a less crowded server..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 50)
        busy = false
        return false
    end

    StatusLabel.Text = "✨ Teleporting..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 230, 255)

    task.wait(0.5)

    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(
            PlaceId,
            server.id,
            LocalPlayer
        )
    end)

    if not ok then
        StatusLabel.Text = "Teleport failed!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        busy = false
        return false
    end

    return true
end

-- HOP BUTTON EVENT
JoinBtn.MouseButton1Click:Connect(function()
    if busy then
        return
    end

    JoinBtn.Active = false
    joinOnce()

    task.wait(2)

    JoinBtn.Active = true
end)

-- AUTO HOP EVENT
AutoBtn.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled

    if autoEnabled then
        AutoBtn.Text = "🌈 AUTO HOP: ENABLED"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
        AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

        autoThread = task.spawn(function()
            while autoEnabled and ScreenGui.Parent do
                local threshold = math.max(
                    1,
                    math.floor(tonumber(MaxBox.Text) or 1)
                )

                local count = #Players:GetPlayers()

                if count <= threshold then
                    StatusLabel.Text = "✨ Optimal server!"
                    StatusLabel.TextColor3 = Color3.fromRGB(0, 230, 150)
                    task.wait(3)
                else
                    joinOnce()
                    task.wait(5)
                end
            end
        end)
    else
        AutoBtn.Text = "👻 AUTO HOP: DISABLED"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
        AutoBtn.TextColor3 = Color3.fromRGB(180, 180, 200)

        if autoThread then
            task.cancel(autoThread)
            autoThread = nil
        end

        StatusLabel.Text = "Auto hop stopped."
        StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
    end
end)

StatusLabel.Text = "🎃 Set max players & click Hop!"BLED"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
        AutoBtn.TextColor3 = Color3.fromRGB(180, 180, 200)
        if autoThread then
            task.cancel(autoThread)
            autoThread = nil
        end
        StatusLabel.Text = "Auto hop stopped."
        StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
    end
end)

StatusLabel.Text = "Set max threshold & click Hop."
