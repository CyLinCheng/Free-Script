local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/windui(2).lua"))()

local Window = WindUI:CreateWindow({
  Title = "旧冬V3",
  Icon = "crown",
  Author = "By XiaoXu",
  Folder = "旧冬&UnicoX",
  Size = UDim2.fromOffset(560, 360),
  Transparent = true,
  Theme = "Dark",
  User = {
    Enabled = true,
    Callback = function() print("clicked") end,
    Anonymous = true
  },
})

Window:EditOpenButton({
  Title = "旧冬V3",
  Icon = "crown",
  CornerRadius = UDim.new(0,16),
  StrokeThickness = 2,
  Color = ColorSequence.new(
  Color3.fromHex("FF0F7B"),
  Color3.fromHex("F89B29")
  ),
  Draggable = true,
})

function Tab(a)
  return Window:Tab({Title = a, Icon = "eye"})
end
function Button(a, b, c)
  return a:Button({Title = b, Callback = c})
end
function Toggle(a, b, c, d)
  return a:Toggle({Title = b, Value = c, Callback = d})
end
function Slider(a, b, c, d, e, f)
  return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end
function Dropdown(a, b, c, d, e)
  return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

local Tab1 = Tab("通用")
local Tab2 = Tab("Forsaken")
local Tab3 = Tab("森林中的99夜")
local Tab4 = Tab("战争大亨")

Button(Tab1, "飞行", function() loadstring(game:HttpGet'https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E9%A3%9E%E8%A1%8C%E7%A4%BA%E4%BE%8B.lua')() end)
Button(Tab1,"踏空行走", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()end)
Button(Tab1,"透视", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'))()end)
Button(Tab1,"无限收益（copyid 输入别人名字获得id可搭配换皮肤使用）", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)
Button(Tab1,"光影", function()loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw'))()end)
Button(Tab1,"无头加kor", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))() end)
Button(Tab1,"情云同款自瞄可调", function() 
    local fov = 100 
    local smoothness = 10 
    local crosshairDistance = 5 
    local RunService = game:GetService("RunService") 
    local UserInputService = game:GetService("UserInputService") 
    local Players = game:GetService("Players") 
    local Cam = game.Workspace.CurrentCamera 
    local FOVring = Drawing.new("Circle") 
    FOVring.Visible = true 
    FOVring.Thickness = 2 
    FOVring.Color = Color3.fromRGB(0, 255, 0) 
    FOVring.Filled = false 
    FOVring.Radius = fov 
    FOVring.Position = Cam.ViewportSize / 2 
    local Player = Players.LocalPlayer 
    local PlayerGui = Player:WaitForChild("PlayerGui") 
    local ScreenGui = Instance.new("ScreenGui") 
    ScreenGui.Name = "FovAdjustGui" 
    ScreenGui.Parent = PlayerGui 
    local Frame = Instance.new("Frame") 
    Frame.Name = "MainFrame" 
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) 
    Frame.BorderSizePixel = 2 
    Frame.Position = UDim2.new(0.3, 0, 0.3, 0) 
    Frame.Size = UDim2.new(0.4, 0, 0.4, 0) 
    Frame.Active = true 
    Frame.Draggable = true 
    Frame.Parent = ScreenGui 
    local MinimizeButton = Instance.new("TextButton") 
    MinimizeButton.Name = "MinimizeButton" 
    MinimizeButton.Text = "-" 
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) 
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) 
    MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) 
    MinimizeButton.Parent = Frame 
    local isMinimized = false 
    MinimizeButton.MouseButton1Click:Connect(function() 
        isMinimized = not isMinimized 
        if isMinimized then 
            Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) 
            MinimizeButton.Text = "+" 
        else 
            Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) 
            MinimizeButton.Text = "-" 
        end 
    end) 
    local FovLabel = Instance.new("TextLabel") 
    FovLabel.Name = "FovLabel" 
    FovLabel.Text = "自瞄范围" 
    FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
    FovLabel.BackgroundTransparency = 1 
    FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) 
    FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
    FovLabel.Parent = Frame 
    local FovSlider = Instance.new("TextBox") 
    FovSlider.Name = "FovSlider" 
    FovSlider.Text = tostring(fov) 
    FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
    FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) 
    FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
    FovSlider.Parent = Frame 
    local SmoothnessLabel = Instance.new("TextLabel") 
    SmoothnessLabel.Name = "SmoothnessLabel" 
    SmoothnessLabel.Text = "自瞄平滑度" 
    SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
    SmoothnessLabel.BackgroundTransparency = 1 
    SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) 
    SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
    SmoothnessLabel.Parent = Frame 
    local SmoothnessSlider = Instance.new("TextBox") 
    SmoothnessSlider.Name = "SmoothnessSlider" 
    SmoothnessSlider.Text = tostring(smoothness) 
    SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
    SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) 
    SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
    SmoothnessSlider.Parent = Frame 
    local CrosshairDistanceLabel = Instance.new("TextLabel") 
    CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" 
    CrosshairDistanceLabel.Text = "自瞄预判距离" 
    CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
    CrosshairDistanceLabel.BackgroundTransparency = 1 
    CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) 
    CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
    CrosshairDistanceLabel.Parent = Frame 
    local CrosshairDistanceSlider = Instance.new("TextBox") 
    CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" 
    CrosshairDistanceSlider.Text = tostring(crosshairDistance) 
    CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
    CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) 
    CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
    CrosshairDistanceSlider.Parent = Frame 
    local targetCFrame = Cam.CFrame 
    local function updateDrawings() 
        local camViewportSize = Cam.ViewportSize 
        FOVring.Position = camViewportSize / 2 
        FOVring.Radius = fov 
    end 
    local function onKeyDown(input) 
        if input.KeyCode == Enum.KeyCode.Delete then 
            RunService:UnbindFromRenderStep("FOVUpdate") 
            FOVring:Remove() 
        end 
    end 
    UserInputService.InputBegan:Connect(onKeyDown) 
    local function getClosestPlayerInFOV(trg_part) 
        local nearest = nil 
        local last = math.huge 
        local playerMousePos = Cam.ViewportSize / 2 
        for _, player in ipairs(Players:GetPlayers()) do 
            if player ~= Players.LocalPlayer then 
                local part = player.Character and player.Character:FindFirstChild(trg_part) 
                if part then 
                    local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) 
                    local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude 
                    if distance < last and isVisible and distance < fov then 
                        last = distance 
                        nearest = player 
                    end 
                end 
            end 
        end 
        return nearest 
    end 
    RunService.RenderStepped:Connect(function() 
        updateDrawings() 
        local closest = getClosestPlayerInFOV("Head") 
        if closest and closest.Character:FindFirstChild("Head") then 
            local targetCharacter = closest.Character 
            local targetHead = targetCharacter.Head 
            local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") 
            local isMoving = targetRootPart and targetRootPart.Velocity.Magnitude > 0.1 
            local targetPosition 
            if isMoving then 
                targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) 
            else 
                targetPosition = targetHead.Position 
            end 
            targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) 
        else 
            targetCFrame = Cam.CFrame 
        end 
        Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) 
    end) 
    FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
        if enterPressed then 
            local newFov = tonumber(FovSlider.Text) 
            if newFov then 
                fov = newFov 
            else 
                FovSlider.Text = tostring(fov) 
            end 
        end 
    end) 
    SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
        if enterPressed then 
            local newSmoothness = tonumber(SmoothnessSlider.Text) 
            if newSmoothness then 
                smoothness = newSmoothness 
            else 
                SmoothnessSlider.Text = tostring(smoothness) 
            end 
        end 
    end) 
    CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
        if enterPressed then 
            local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) 
            if newCrosshairDistance then 
                crosshairDistance = newCrosshairDistance 
            else 
                CrosshairDistanceSlider.Text = tostring(crosshairDistance) 
            end 
        end 
    end) 
end)

local ESPEnabled = false
local ESPConnections = {}

local function removeESP(player)
    if ESPConnections[player] then
        ESPConnections[player]:Disconnect()
        ESPConnections[player] = nil
    end
    if player and player.Character then
        local highlight = player.Character:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end
        local billboard = player.Character:FindFirstChildOfClass("BillboardGui")
        if billboard then
            billboard:Destroy()
        end
    end
end

local function applyESP(player)
    if player == game.Players.LocalPlayer then return end
    
    removeESP(player)
    
    local function addESP(character)
        if not character then return end
        
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.Adornee = character
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        
        local billboard = Instance.new("BillboardGui")
        billboard.Parent = character
        billboard.Adornee = character
        billboard.Size = UDim2.new(0, 100, 0, 100)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextStrokeTransparency = 0.5
        nameLabel.TextScaled = true
        
        local circle = Instance.new("ImageLabel")
        circle.Parent = billboard
        circle.Size = UDim2.new(0, 50, 0, 50)
        circle.Position = UDim2.new(0.5, 0, 0.5, 0)
        circle.AnchorPoint = Vector2.new(0.5, 0.5)
        circle.BackgroundTransparency = 1
        circle.Image = "rbxassetid://2200552246"
        
        ESPConnections[player] = character:GetPropertyChangedSignal("Parent"):Connect(function()
            if not character.Parent then
                removeESP(player)
            end
        end)
    end
    
    if player.Character then
        addESP(player.Character)
    end
    
    local conn = player.CharacterAdded:Connect(function(character)
        addESP(character)
    end)
    ESPConnections[player] = conn
end

Toggle(Tab1, "Circle ESP", false, function(state)
    ESPEnabled = state
    
    if state then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                applyESP(player)
            end
        end
        
        local playerAddedConn = game.Players.PlayerAdded:Connect(function(player)
            applyESP(player)
        end)
        table.insert(ESPConnections, playerAddedConn)
        
        local playerRemovingConn = game.Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
        table.insert(ESPConnections, playerRemovingConn)
    else
        for player, connection in pairs(ESPConnections) do
            if typeof(connection) == "RBXScriptConnection" then
                connection:Disconnect()
            end
        end
        ESPConnections = {}
        
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                removeESP(player)
            end
        end
    end
end)

Button(Tab1,"dex", function()        
    loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
end)

Button(Tab2,"旧冬Forsaken", function()        
    getgenv().XiaoXu="旧冬Q群:467989227"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E6%97%A7%E5%86%ACScript--Forsaken.lua.txt"))()
end)

local AutoBlockEnabled = false
local BlockConnection

local function setupAutoBlock()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")

    local config = {
        BlockDistance = 15,
        ScanInterval = 0.05,
        BlockCooldown = 0.5,
        DebugMode = true,
        TargetSoundIds = {
            "rbxassetid://102228729296384",
            "rbxassetid://140242176732868",
            "rbxassetid://12222216",
            "rbxassetid://86174610237192",
            "rbxassetid://101199185291628",
            "rbxassetid://95079963655241",
            "rbxassetid://112809109188560",
            "rbxassetid://84307400688050",
            "rbxassetid://136323728355613",
            "rbxassetid://115026634746636"
        }
    }

    local LocalPlayer = Players.LocalPlayer
    local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
    local lastBlockTime = 0

    local function HasTargetSound(character)
        if not character then return false end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, child in ipairs(humanoidRootPart:GetDescendants()) do
                if child:IsA("Sound") then
                    for _, targetId in ipairs(config.TargetSoundIds) do
                        if child.SoundId == targetId then
                            if config.DebugMode then
                                print("Audio detected:", humanoidRootPart:GetFullName(), "ID:", child.SoundId)
                            end
                            return true
                        end
                    end
                end
            end
        end
        
        for _, sound in ipairs(character:GetDescendants()) do
            if sound:IsA("Sound") then
                for _, targetId in ipairs(config.TargetSoundIds) do
                    if sound.SoundId == targetId then
                        if config.DebugMode then
                            print("Audio detected:", sound:GetFullName(), "ID:", sound.SoundId)
                        end
                        return true
                    end
                end
            end
        end
        
        return false
    end

    local function GetKillersInRange()
        local killers = {}
        local killersFolder = workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
        if not killersFolder then return killers end
        
        local myCharacter = LocalPlayer.Character
        if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then return killers end
        
        local myPos = myCharacter.HumanoidRootPart.Position
        
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:FindFirstChild("HumanoidRootPart") then
                local distance = (killer.HumanoidRootPart.Position - myPos).Magnitude
                if distance <= config.BlockDistance then
                    table.insert(killers, killer)
                end
            end
        end
        
        return killers
    end

    local function PerformBlock()
        if os.clock() - lastBlockTime >= config.BlockCooldown then
            RemoteEvent:FireServer("UseActorAbility", "Block")
            lastBlockTime = os.clock()
            if config.DebugMode then
                print("Block performed at:", os.clock())
            end
        end
    end

    local function CheckConditions()
        local killers = GetKillersInRange()
        
        for _, killer in ipairs(killers) do
            if HasTargetSound(killer) then
                PerformBlock()
                break
            end
        end
    end

    local function Initialize()
        if not LocalPlayer.Character then
            LocalPlayer.CharacterAdded:Wait()
        end

        BlockConnection = RunService.Stepped:Connect(function()
            pcall(CheckConditions)
        end)
        
        print("Block system initialized")
        print("Range:", config.BlockDistance, "m | Audio IDs:", #config.TargetSoundIds)
    end

    Initialize()
end

Toggle(Tab2, "自动格挡", false, function(state)
    AutoBlockEnabled = state
    
    if state then
        setupAutoBlock()
    else
        if BlockConnection then
            BlockConnection:Disconnect()
            BlockConnection = nil
        end
    end
end)

local RepairEnabled = false
local RepairConnection

Toggle(Tab2, "自动修电机", false, function(state)
    RepairEnabled = state
    
    if state then
        local function RepairGenerators()
            local map = workspace:FindFirstChild("Map")
            local ingame = map and map:FindFirstChild("Ingame")
            local currentMap = ingame and ingame:FindFirstChild("Map")

            if currentMap then
                for _, obj in ipairs(currentMap:GetChildren()) do
                    if obj.Name == "Generator" and obj:FindFirstChild("Progress") and obj.Progress.Value < 100 then
                        local remote = obj:FindFirstChild("Remotes") and obj.Remotes:FindFirstChild("RE")
                        if remote then
                            remote:FireServer()
                        end
                    end
                end
            end
        end

        RepairConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if RepairEnabled then
                RepairGenerators()
            end
        end)
    else
        if RepairConnection then
            RepairConnection:Disconnect()
            RepairConnection = nil
        end
    end
end)

local InfiniteStaminaEnabled = false
local StaminaConnection
local sprintModule

local function setupInfiniteStamina()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    
    local function modifyStaminaSettings()
        pcall(function()
            if not sprintModule then
                local success, module = pcall(require, ReplicatedStorage.Systems.Character.Game.Sprinting)
                if success and module then
                    sprintModule = module
                else
                    return
                end
            end
            if sprintModule and sprintModule.StaminaLossDisabled ~= nil then
                sprintModule.StaminaLossDisabled = InfiniteStaminaEnabled
            end
        end)
    end
    
    StaminaConnection = RunService.Heartbeat:Connect(function()
        if InfiniteStaminaEnabled then
            modifyStaminaSettings()
        end
    end)
end

Toggle(Tab2, "无限体力", false, function(state)
    InfiniteStaminaEnabled = state
    
    if state then
        setupInfiniteStamina()
    else
        if StaminaConnection then
            StaminaConnection:Disconnect()
            StaminaConnection = nil
        end
        if sprintModule and sprintModule.StaminaLossDisabled ~= nil then
            sprintModule.StaminaLossDisabled = false
        end
    end
end)

local PredictionAim = {
    Enabled = false,
    Prediction = 0.1
}

Toggle(Tab2, "自瞄", false, function(state)
    PredictionAim.Enabled = state
end)

Toggle(Tab2, "预测", false, function(state)
    if state then
        PredictionAim.Prediction = 0.1
    else
        PredictionAim.Prediction = 0
    end
end)

Button(Tab2,"自动格挡+拳击", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepo/main/autoblockpunch.lua"))()
end)

local AutoPopupEnabled = false
local PopupConnection

local function setupAutoPopup()
    PopupConnection = game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
                if gui.Name == "Popup" or gui:IsA("ScreenGui") and gui.Name:find("Popup") then
                    gui:Destroy()
                end
            end
            for _, playerGui in pairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
                if playerGui.Name == "Popup" or playerGui:IsA("ScreenGui") and playerGui.Name:find("Popup") then
                    playerGui:Destroy()
                end
            end
        end)
    end)
end

local function stopAutoPopup()
    if PopupConnection then
        PopupConnection:Disconnect()
        PopupConnection = nil
    end
end

Toggle(Tab2, "阻止1×弹窗", false, function(state)
    AutoPopupEnabled = state
    
    if state then
        setupAutoPopup()
    else
        stopAutoPopup()
    end
end)

local Tab3Settings = {
    autoFarm = false,
    playerEsp = false,
    itemEsp = false
}

local plr = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")

local function makeEsp(obj, color, name)
    if not obj then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Parent = obj
    highlight.FillColor = color
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.Name = "ESP"
    
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = obj
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    
    local text = Instance.new("TextLabel")
    text.Parent = billboard
    text.BackgroundTransparency = 1
    text.Text = name or obj.Name
    text.TextColor3 = color
    text.TextSize = 20
    text.Size = UDim2.new(1, 0, 1, 0)
end

local function removeEsp(obj)
    if obj:FindFirstChild("ESP") then
        obj.ESP:Destroy()
    end
    for _, child in pairs(obj:GetChildren()) do
        if child:IsA("BillboardGui") then
            child:Destroy()
        end
    end
end

Toggle(Tab3, "上帝视角", false, function(state)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        if state then
            plr.Character.Humanoid.MaxHealth = math.huge
            plr.Character.Humanoid.Health = math.huge
        else
            plr.Character.Humanoid.MaxHealth = 100
            plr.Character.Humanoid.Health = 100
        end
    end
end)

Toggle(Tab3, "自动砍树", false, function(state)
    Tab3Settings.autoFarm = state
    if state then
        spawn(function()
            local toolDamage = rs.RemoteEvents:FindFirstChild("ToolDamageObject")
            while Tab3Settings.autoFarm do
                local trees = {}
                
                if workspace:FindFirstChild("Map") then
                    local landmarks = workspace.Map:FindFirstChild("Landmarks") or workspace.Map:FindFirstChild("Foliage")
                    if landmarks then
                        for _,v in pairs(landmarks:GetChildren()) do
                            if v.Name == "Small Tree" and v:FindFirstChild("Trunk") then
                                table.insert(trees, v)
                            end
                        end
                    end
                end
                
                for _,tree in pairs(trees) do
                    if not Tab3Settings.autoFarm then break end
                    if tree and tree.Parent then
                        local myChar = plr.Character
                        local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
                        if root and tree:FindFirstChild("Trunk") then
                            root.CFrame = tree.Trunk.CFrame * CFrame.new(3, 0, 0)
                            wait(0.3)
                            
                            local axe = nil
                            if plr:FindFirstChild("Inventory") then
                                axe = plr.Inventory:FindFirstChild("Old Axe") or plr.Inventory:FindFirstChild("Good Axe")
                            end
                            
                            if axe then
                                if axe.Parent == plr.Backpack then
                                    axe.Parent = myChar
                                    wait(0.2)
                                end
                                
                                while tree.Parent and Tab3Settings.autoFarm do
                                    pcall(function()
                                        axe:Activate()
                                        if toolDamage then
                                            toolDamage:InvokeServer(tree, axe, "1_8264699301", tree.Trunk.CFrame)
                                        end
                                    end)
                                    wait(0.8)
                                end
                            end
                        end
                    end
                    wait(0.5)
                end
                wait(2)
            end
        end)
    end
end)

Toggle(Tab3, "透视玩家", false, function(state)
    Tab3Settings.playerEsp = state
    if state then
        spawn(function()
            while Tab3Settings.playerEsp do
                for _,player in pairs(game.Players:GetPlayers()) do
                    if player ~= plr and player.Character then
                        if not player.Character:FindFirstChild("ESP") then
                            makeEsp(player.Character, Color3.new(0, 1, 0), player.Name)
                        end
                    end
                end
                wait(1)
            end
        end)
    else
        for _,player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                removeEsp(player.Character)
            end
        end
    end
end)

Toggle(Tab3, "物品透视", false, function(state)
    Tab3Settings.itemEsp = state
    if state then
        spawn(function()
            while Tab3Settings.itemEsp do
                for _,item in pairs(workspace.Items:GetChildren()) do
                    if item:IsA("Model") and not item:FindFirstChild("ESP") then
                        makeEsp(item, Color3.new(1, 1, 0), item.Name)
                    end
                end
                wait(2)
            end
        end)
    else
        for _,item in pairs(workspace.Items:GetChildren()) do
            removeEsp(item)
        end
    end
end)

Toggle(Tab3, "快速交互", false, function(state)
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            v.HoldDuration = state and 0 or 0.5
        end
    end
end)

Button(Tab4,"范围", function()                   
    _G.HeadSize = 150 
    _G.Disabled = true 
    game:GetService('RunService').RenderStepped:connect(function() 
        if _G.Disabled then 
            for _,v in next, game:GetService('Players'):GetPlayers() do 
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
                    pcall(function() 
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
                            v.Character.HumanoidRootPart.Transparency = 0.7 
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") 
                            v.Character.HumanoidRootPart.Material = "Neon" 
                            v.Character.HumanoidRootPart.CanCollide = false
                        end
                    end) 
                end 
            end 
        end 
    end)
end)

Button(Tab4,"无限子弹", function() 
    local lp = game.Players.LocalPlayer 
    for _, v in next, lp.Backpack:GetDescendants() do 
        if v.Name == 'Settings' then 
            local success, settingsModule = pcall(require, v) 
            if success then 
                settingsModule.Ammo = math.huge 
            else 
                warn("无法要求设置: " ..
                tostring(settingsModule)) 
            end 
        end 
    end
end)

Button(Tab4,"传送空投", function() 
    local Folder = workspace["Game Systems"] 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        for _, Child in ipairs(Folder:GetDescendants()) do 
            if Child.Name:match("Airdrop_") and Child:FindFirstChild("MainPart") then 
                player.HumanoidRootPart.CFrame = Child.MainPart.CFrame 
            end 
        end
    end
end)

Button(Tab4,"传送回基地", function() 
    local player = game:GetService("Players").LocalPlayer
    if player.Character then
        local teamValue = player.leaderstats and player.leaderstats.Team and player.leaderstats.Team.Value
        if teamValue and workspace.Tycoon and workspace.Tycoon.Tycoons and workspace.Tycoon.Tycoons[teamValue] then
            local tycoon = workspace.Tycoon.Tycoons[teamValue]
            if tycoon.Essentials and tycoon.Essentials.Spawn then
                player.Character:MoveTo(tycoon.Essentials.Spawn.Position)
            end
        end
    end
end)

Button(Tab4,"传送旗帜", function() 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        player.HumanoidRootPart.CFrame = CFrame.new(73.22032928466797, 47.9999885559082, 191.06993103027344)
    end
end)

Button(Tab4,"传送油桶1", function() 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        player.HumanoidRootPart.CFrame = CFrame.new(-9.748652458190918, 48.662540435791016, 700.2245483398438)
    end
end)

Button(Tab4,"传送油桶2", function() 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        player.HumanoidRootPart.CFrame = CFrame.new(76.48243713378906, 105.25657653808594, -2062.3896484375)
    end
end)

Button(Tab4,"传送油桶3", function() 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        player.HumanoidRootPart.CFrame = CFrame.new(-28.840208053588867, 49.34040069580078, -416.9921569824219)
    end
end)

Button(Tab4,"传送油桶4", function() 
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        player.HumanoidRootPart.CFrame = CFrame.new(69.48390197753906, 105.25657653808594, 3434.9033203125)
    end
end)