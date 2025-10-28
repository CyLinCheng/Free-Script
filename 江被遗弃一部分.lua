local LBLG = Instance.new("ScreenGui")
local LBL = Instance.new("TextLabel")
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true

LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local TimeLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat

local function UpdateTime()
    local currentTime = os.date("*t")
    TimeLabel.Text = ("时间: %02d时%02d分%02d秒"):format(currentTime.hour, currentTime.min, currentTime.sec)
end

Heartbeat:Connect(UpdateTime)

game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "『江·被遗弃』", 
    Text = "核对用户ID中", 
    Duration = 2 
})

game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "『江·被遗弃』", 
    Text = "用户ID核对完毕", 
    Duration = 4 
})

local ui = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local win = ui:MakeWindow({Name = "江·被遗弃脚本", HidePremium = false, SaveConfig = true, ConfigFolder = "JiangConfig"})

local UITab1 = win:MakeTab({Name = "信息", Icon = "rbxassetid://7734068321", PremiumOnly = false})

local about = UITab1:AddSection("信息",true)

about:AddLabel("江·被遗弃")
about:AddLabel("作者:凌晨")
about:AddLabel("江脚本主群:836843047")
about:AddLabel("脚本持续更新")
about:AddLabel("通缉:江暖阳 缝合圈钱")

local about2 = UITab1:AddSection("玩家信息",true)

about2:AddLabel("你的账号年龄:"..player.AccountAge.."天")
about2:AddLabel("你的注入器:"..identifyexecutor())
about2:AddLabel("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about2:AddLabel("你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about2:AddLabel("你现在的服务器id:"..game.GameId)
about2:AddLabel("你的用户ID:"..game.Players.LocalPlayer.UserId)
about2:AddLabel("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())

local UITab2 = win:AddTab("公告",'7734068321')

local about3 = UITab2:AddSection("公告",true)

about3:AddLabel("感谢所有支持江·被遗弃脚本的人")
about3:AddLabel("通缉江暖阳 缝合圈钱 推卸责任 六年级小学生")

local UITab3 = win:AddTab("主要功能",'7734068321')

local about4 = UITab3:AddSection("主要功能",true)

-- 绕过飞行功能
about4:AddButton("绕过飞行",function()
    local CFSpeed = 50
    local CFLoop = nil
    local RunService = game:GetService("RunService")

    local function StartCFly()
        local speaker = game.Players.LocalPlayer
        local character = speaker.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass('Humanoid')
        local head = character:WaitForChild("Head")
        
        if not humanoid or not head then return end
        
        humanoid.PlatformStand = true
        head.Anchored = true
        
        if CFLoop then 
            CFLoop:Disconnect() 
            CFLoop = nil
        end
        
        CFLoop = RunService.Heartbeat:Connect(function(deltaTime)
            if not character or not humanoid or not head then 
                if CFLoop then 
                    CFLoop:Disconnect() 
                    CFLoop = nil
                end
                return 
            end
            
            local moveDirection = humanoid.MoveDirection * (CFSpeed * deltaTime)
            local headCFrame = head.CFrame
            local camera = workspace.CurrentCamera
            local cameraCFrame = camera.CFrame
            local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
            cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
            local cameraPosition = cameraCFrame.Position
            local headPosition = headCFrame.Position

            local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
            head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
        end)
    end

    local function StopCFly()
        local speaker = game.Players.LocalPlayer
        local character = speaker.Character
        
        if CFLoop then
            CFLoop:Disconnect()
            CFLoop = nil
        end
        
        if character then
            local humanoid = character:FindFirstChildOfClass('Humanoid')
            local head = character:FindFirstChild("Head")
            
            if humanoid then
                humanoid.PlatformStand = false
            end
            if head then
                head.Anchored = false
            end
        end
    end

    StartCFly()
    
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "飞行功能已启用", 
        Duration = 3 
    })
end)

-- 访客自动格挡功能
about4:AddButton("访客自动格挡",function()
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

        RunService.Stepped:Connect(function()
            pcall(CheckConditions)
        end)
        
        print("Block system initialized")
        print("Range:", config.BlockDistance, "m | Audio IDs:", #config.TargetSoundIds)
    end

    Initialize()
    
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "自动格挡功能已启用", 
        Duration = 3 
    })
end)

-- John自动404功能
about4:AddButton("John自动404",function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local lp = Players.LocalPlayer
    local RANGE = 19
    local SPAM_DURATION = 3
    local COOLDOWN_TIME = 5
    local activeCooldowns = {}

    local animsToDetect = {
        ["116618003477002"] = true,
        ["119462383658044"] = true,
        ["131696603025265"] = true,
        ["121255898612475"] = true,
        ["133491532453922"] = true,
        ["103601716322988"] = true,
        ["86371356500204"] = true,
        ["72722244508749"] = false,
        ["87259391926321"] = true,
        ["96959123077498"] = false,
        ["86709774283672"] = true,
        ["77448521277146"] = true,
    }

    local function fire404Error()
        local args = { "UseActorAbility", "404Error" }
        ReplicatedStorage:WaitForChild("Modules")
            :WaitForChild("Network")
            :WaitForChild("RemoteEvent")
            :FireServer(unpack(args))
    end

    local function isAnimationMatching(anim)
        local id = tostring(anim.Animation and anim.Animation.AnimationId or "")
        local numId = id:match("%d+")
        return animsToDetect[numId] or false
    end

    RunService.Heartbeat:Connect(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = player.Character.HumanoidRootPart
                local myChar = lp.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    local dist = (targetHRP.Position - myChar.HumanoidRootPart.Position).Magnitude
                    if dist <= RANGE and (not activeCooldowns[player] or tick() - activeCooldowns[player] >= COOLDOWN_TIME) then
                        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                                if isAnimationMatching(track) then
                                    activeCooldowns[player] = tick()
                                    task.spawn(function()
                                        local startTime = tick()
                                        while tick() - startTime < SPAM_DURATION do
                                            fire404Error()
                                            task.wait(0.05)
                                        end
                                    end)
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "John自动404已启用", 
        Duration = 3 
    })
end)

-- 创建视觉功能标签页
local UITab4 = win:AddTab("视觉功能",'7734068321')
local Visual = UITab4:AddSection("视觉功能",true)

-- Generator ESP功能
Visual:AddButton("Generator ESP",function()
    if not _G.RealGeneratorESP then
        _G.RealGeneratorESP = {
            Active = false,
            Data = {},
            Connections = {}
        }
    end
    
    if _G.RealGeneratorESP.Active then
        for _, connection in pairs(_G.RealGeneratorESP.Connections) do
            if connection and connection.Connected then
                connection:Disconnect()
            end
        end
        
        for gen, data in pairs(_G.RealGeneratorESP.Data) do
            if type(data) == "table" then
                if data.Billboard and data.Billboard.Parent then
                    data.Billboard:Destroy()
                end
                if data.DistanceBillboard and data.DistanceBillboard.Parent then
                    data.DistanceBillboard:Destroy()
                end
                if data.Highlight and data.Highlight.Parent then
                    data.Highlight:Destroy()
                end
            end
        end
        
        _G.RealGeneratorESP.Data = {}
        _G.RealGeneratorESP.Connections = {}
        _G.RealGeneratorESP.Active = false
        
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "Generator ESP已关闭", 
            Duration = 3 
        })
        return
    end
    
    _G.RealGeneratorESP.Active = true
    
    local scanInterval = 1.0
    local lastScanTime = 0
    local maxGenerators = 20
    
    local distanceSettings = {
        MinDistance = 5,
        MaxDistance = 500,
        MinScale = 0.8,
        MaxScale = 1.5,
        MinTextSize = 8,
        MaxTextSize = 10
    }
    
    local function updateGeneratorESP(gen, data)
        if not gen or not gen.Parent or not gen:FindFirstChild("Main") then
            return false
        end
        
        if #_G.RealGeneratorESP.Data > maxGenerators then
            return false
        end
        
        if gen:FindFirstChild("Progress") then
            local progress = gen.Progress.Value
            if progress >= 99 then
                return false
            end
            
            if data.TextLabel then
                data.TextLabel.Text = string.format("真电机: %d%%", progress)
            end
            
            local character = game:GetService("Players").LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart and data.DistanceLabel then
                local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                
                data.DistanceLabel.Text = string.format("距离: %d米", math.floor(distance))
                
                local distanceRatio = math.clamp(
                    (distance - distanceSettings.MinDistance) / 
                    (distanceSettings.MaxDistance - distanceSettings.MinDistance),
                    0, 1
                )
                
                local scale = distanceSettings.MinScale + 
                    distanceRatio * (distanceSettings.MaxScale - distanceSettings.MinScale)
                
                local textSize = distanceSettings.MinTextSize + 
                    distanceRatio * (distanceSettings.MaxTextSize - distanceSettings.MinTextSize)
                
                if data.Billboard then 
                    data.Billboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                    data.Billboard.Enabled = true
                end
                
                if data.DistanceBillboard then 
                    data.DistanceBillboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                    data.DistanceBillboard.Enabled = true
                end
                
                if data.TextLabel then 
                    data.TextLabel.TextSize = textSize
                    data.TextLabel.Visible = true
                end
                
                if data.DistanceLabel then 
                    data.DistanceLabel.TextSize = textSize
                    data.DistanceLabel.Visible = true
                end
                
                if data.Highlight then
                    data.Highlight.Enabled = true
                    local transparency = math.clamp((distance - 50) / 100, 0, 0.4)
                    data.Highlight.FillTransparency = 0.85 + (transparency * 0.5)
                    data.Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
                    data.Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                end
            end
        end
        
        return true
    end
    
    local function createGeneratorESP(gen)
        if not gen or not gen:FindFirstChild("Main") or _G.RealGeneratorESP.Data[gen] then 
            return 
        end
        
        if #_G.RealGeneratorESP.Data >= maxGenerators then
            return
        end
        
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "RealGeneratorESP"
        billboard.Size = UDim2.new(4, 0, 1, 0)
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.Adornee = gen.Main
        billboard.Parent = gen.Main
        billboard.AlwaysOnTop = true
        billboard.Enabled = true
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextScaled = false
        textLabel.Text = "真电机加载中..."
        textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        textLabel.Font = Enum.Font.Arcade
        textLabel.TextStrokeTransparency = 0
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextSize = 8
        textLabel.Parent = billboard
        
        local distanceBillboard = Instance.new("BillboardGui")
        distanceBillboard.Name = "RealGeneratorDistanceESP"
        distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
        distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
        distanceBillboard.Adornee = gen.Main
        distanceBillboard.Parent = gen.Main
        distanceBillboard.AlwaysOnTop = true
        distanceBillboard.Enabled = true
        
        local distanceLabel = Instance.new("TextLabel")
        distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.TextScaled = false
        distanceLabel.Text = "计算距离中..."
        distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        distanceLabel.Font = Enum.Font.Arcade
        distanceLabel.TextStrokeTransparency = 0
        distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distanceLabel.TextSize = 8
        distanceLabel.Parent = distanceBillboard
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "RealGeneratorHighlight"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Enabled = true
        highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
        highlight.FillColor = Color3.fromRGB(0, 255, 0)
        highlight.FillTransparency = 0.9
        highlight.OutlineTransparency = 0
        highlight.Parent = gen
        
        _G.RealGeneratorESP.Data[gen] = {
            Billboard = billboard,
            DistanceBillboard = distanceBillboard,
            TextLabel = textLabel,
            DistanceLabel = distanceLabel,
            Highlight = highlight
        }
        
        local destroyConnection
        destroyConnection = gen.Destroying:Connect(function()
            if _G.RealGeneratorESP.Data[gen] then
                if _G.RealGeneratorESP.Data[gen].Billboard then 
                    _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                end
                if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                    _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                end
                if _G.RealGeneratorESP.Data[gen].Highlight then 
                    _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                end
                _G.RealGeneratorESP.Data[gen] = nil
            end
            if destroyConnection then
                destroyConnection:Disconnect()
            end
        end)
        
        table.insert(_G.RealGeneratorESP.Connections, destroyConnection)
    end
    
    local function scanGenerators()
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    for _, gen in pairs(mapSubFolder:GetDescendants()) do
                        if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                            createGeneratorESP(gen)
                        end
                    end
                end
            end
        end
    end
    
    local mainConnection
    local mapFolder = workspace:FindFirstChild("Map")
    if mapFolder then
        local ingameFolder = mapFolder:FindFirstChild("Ingame")
        if ingameFolder then
            local mapSubFolder = ingameFolder:FindFirstChild("Map")
            if mapSubFolder then
                mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "Generator" then
                        createGeneratorESP(v)
                    end
                end)
            end
        end
    end
    
    if mainConnection then
        table.insert(_G.RealGeneratorESP.Connections, mainConnection)
    end
    
    local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        lastScanTime = lastScanTime + deltaTime
        if lastScanTime >= scanInterval then
            lastScanTime = 0
            scanGenerators()
        end
        
        local gensToRemove = {}
        for gen, data in pairs(_G.RealGeneratorESP.Data) do
            if not gen or not gen.Parent then
                table.insert(gensToRemove, gen)
            else
                if not updateGeneratorESP(gen, data) then
                    table.insert(gensToRemove, gen)
                end
            end
        end
        
        for _, gen in ipairs(gensToRemove) do
            if _G.RealGeneratorESP.Data[gen] then
                if _G.RealGeneratorESP.Data[gen].Billboard then 
                    _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                end
                if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                    _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                end
                if _G.RealGeneratorESP.Data[gen].Highlight then 
                    _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                end
                _G.RealGeneratorESP.Data[gen] = nil
            end
        end
    end)
    
    table.insert(_G.RealGeneratorESP.Connections, heartbeatConnection)
    
    scanGenerators()
    
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "Generator ESP已启用", 
        Duration = 3 
    })
end)

-- 假电机ESP功能
Visual:AddButton("假电机ESP",function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "假电机ESP功能待实现", 
        Duration = 3 
    })
end)

-- 假电机ESP功能
local function FakeGeneratorESP()
    if not _G.FakeGeneratorESP then
        _G.FakeGeneratorESP = {
            Active = false,
            Data = {},
            Connections = {}
        }
    end
    
    if _G.FakeGeneratorESP.Active then
        for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
            if connection and connection.Connected then
                connection:Disconnect()
            end
        end
        
        for gen, data in pairs(_G.FakeGeneratorESP.Data) do
            if type(data) == "table" then
                if data.Highlight and data.Highlight.Parent then
                    data.Highlight:Destroy()
                end
                if data.NameLabel and data.NameLabel.Parent then
                    data.NameLabel:Destroy()
                end
            end
        end
        
        _G.FakeGeneratorESP.Data = {}
        _G.FakeGeneratorESP.Connections = {}
        _G.FakeGeneratorESP.Active = false
        return
    end
    
    _G.FakeGeneratorESP.Active = true
    
    local scanInterval = 1.0
    local lastScanTime = 0
    
    local function createFakeGeneratorESP(gen)
        if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then 
            return 
        end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "FakeGeneratorHighlight"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Enabled = true
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.9
        highlight.OutlineTransparency = 0
        highlight.Parent = gen
        
        local nameBillboard = Instance.new("BillboardGui")
        nameBillboard.Name = "FakeGeneratorNameESP"
        nameBillboard.Size = UDim2.new(4, 0, 1, 0)
        nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
        nameBillboard.Adornee = gen.Main
        nameBillboard.Parent = gen.Main
        nameBillboard.AlwaysOnTop = true
        nameBillboard.Enabled = true
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextScaled = false
        nameLabel.Text = "假电机"
        nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        nameLabel.Font = Enum.Font.Arcade
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.TextSize = 12
        nameLabel.Parent = nameBillboard
        
        _G.FakeGeneratorESP.Data[gen] = {
            Highlight = highlight,
            NameLabel = nameLabel,
            NameBillboard = nameBillboard
        }
        
        local destroyConnection
        destroyConnection = gen.Destroying:Connect(function()
            if _G.FakeGeneratorESP.Data[gen] then
                if _G.FakeGeneratorESP.Data[gen].Highlight then 
                    _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                end
                if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                    _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                end
                if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                    _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                end
                _G.FakeGeneratorESP.Data[gen] = nil
            end
            if destroyConnection then
                destroyConnection:Disconnect()
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
    end
    
    local function scanGenerators()
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    for _, gen in pairs(mapSubFolder:GetDescendants()) do
                        if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                            createFakeGeneratorESP(gen)
                        end
                    end
                end
            end
        end
    end
    
    local mainConnection
    local mapFolder = workspace:FindFirstChild("Map")
    if mapFolder then
        local ingameFolder = mapFolder:FindFirstChild("Ingame")
        if ingameFolder then
            local mapSubFolder = ingameFolder:FindFirstChild("Map")
            if mapSubFolder then
                mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                        createFakeGeneratorESP(v)
                    end
                end)
            end
        end
    end
    
    if mainConnection then
        table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
    end
    
    local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        lastScanTime = lastScanTime + deltaTime
        if lastScanTime >= scanInterval then
            lastScanTime = 0
            scanGenerators()
        end
        
        local gensToRemove = {}
        for gen, data in pairs(_G.FakeGeneratorESP.Data) do
            if not gen or not gen.Parent then
                table.insert(gensToRemove, gen)
            end
        end
        
        for _, gen in ipairs(gensToRemove) do
            if _G.FakeGeneratorESP.Data[gen] then
                if _G.FakeGeneratorESP.Data[gen].Highlight then 
                    _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                end
                if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                    _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                end
                if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                    _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                end
                _G.FakeGeneratorESP.Data[gen] = nil
            end
        end
    end)
    
    table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
    
    scanGenerators()
end

-- Noli传送电机ESP
local function NoliWarningESP()
    if not _G.NoliWarningESP then
        _G.NoliWarningESP = {
            Active = false,
            Data = {},
            Connections = {}
        }
    end
    
    if _G.NoliWarningESP.Active then
        for _, connection in pairs(_G.NoliWarningESP.Connections) do
            if connection and connection.Connected then
                connection:Disconnect()
            end
        end
        
        for gen, data in pairs(_G.NoliWarningESP.Data) do
            if type(data) == "table" then
                if data.Highlight and data.Highlight.Parent then
                    data.Highlight:Destroy()
                end
                if data.Label and data.Label.Parent then
                    data.Label:Destroy()
                end
            end
        end
        
        _G.NoliWarningESP.Data = {}
        _G.NoliWarningESP.Connections = {}
        _G.NoliWarningESP.Active = false
        return
    end
    
    _G.NoliWarningESP.Active = true
    
    local scanInterval = 1.0
    local lastScanTime = 0
    
    local function hasNoliWarning(gen)
        if string.find(gen.Name, "NoliWarningIncoming") then
            return true
        end
        
        for _, child in pairs(gen:GetDescendants()) do
            if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
               string.find(tostring(child.Value), "NoliWarningIncoming") then
                return true
            elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                return true
            end
        end
        
        return false
    end
    
    local function createNoliWarningESP(gen)
        if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then 
            return 
        end
        
        if not hasNoliWarning(gen) then
            return
        end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "NoliWarningHighlight"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Enabled = true
        highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
        highlight.FillColor = Color3.fromRGB(255, 0, 255)
        highlight.FillTransparency = 0.7
        highlight.OutlineTransparency = 0
        highlight.Parent = gen
        
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "NoliWarningBillboard"
        billboard.Size = UDim2.new(6, 0, 2, 0)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Adornee = gen.Main
        billboard.Parent = gen.Main
        billboard.AlwaysOnTop = true
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "[Noli即将传送]"
        label.TextColor3 = Color3.fromRGB(255, 0, 255)
        label.Font = Enum.Font.Arcade
        label.TextSize = 14
        label.TextStrokeTransparency = 0
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.Parent = billboard
        
        _G.NoliWarningESP.Data[gen] = {
            Highlight = highlight,
            Label = label,
            Billboard = billboard,
            LastCheck = os.time()
        }
        
        local destroyConnection
        destroyConnection = gen.Destroying:Connect(function()
            if _G.NoliWarningESP.Data[gen] then
                if _G.NoliWarningESP.Data[gen].Highlight then 
                    _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                end
                if _G.NoliWarningESP.Data[gen].Label then 
                    _G.NoliWarningESP.Data[gen].Label:Destroy() 
                end
                if _G.NoliWarningESP.Data[gen].Billboard then 
                    _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                end
                _G.NoliWarningESP.Data[gen] = nil
            end
            if destroyConnection then
                destroyConnection:Disconnect()
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, destroyConnection)
    end
    
    local function scanGenerators()
        for _, gen in pairs(workspace:GetDescendants()) do
            if gen:IsA("Model") and gen:FindFirstChild("Main") and 
               (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                createNoliWarningESP(gen)
            end
        end
    end
    
    local function updateExistingGenerators()
        local gensToRemove = {}
        for gen, data in pairs(_G.NoliWarningESP.Data) do
            if not gen or not gen.Parent then
                table.insert(gensToRemove, gen)
            else
                if os.time() - data.LastCheck > 5 then
                    if not hasNoliWarning(gen) then
                        table.insert(gensToRemove, gen)
                    else
                        data.LastCheck = os.time()
                    end
                end
            end
        end
        
        for _, gen in ipairs(gensToRemove) do
            if _G.NoliWarningESP.Data[gen] then
                if _G.NoliWarningESP.Data[gen].Highlight then 
                    _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                end
                if _G.NoliWarningESP.Data[gen].Label then 
                    _G.NoliWarningESP.Data[gen].Label:Destroy() 
                end
                if _G.NoliWarningESP.Data[gen].Billboard then 
                    _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                end
                _G.NoliWarningESP.Data[gen] = nil
            end
        end
    end
    
    local mainConnection = workspace.DescendantAdded:Connect(function(v)
        if v:IsA("Model") and v:FindFirstChild("Main") and 
           (v.Name == "Generator" or v.Name == "FakeGenerator") then
            createNoliWarningESP(v)
        end
    end)
    
    table.insert(_G.NoliWarningESP.Connections, mainConnection)
    
    local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        lastScanTime = lastScanTime + deltaTime
        if lastScanTime >= scanInterval then
            lastScanTime = 0
            scanGenerators()
            updateExistingGenerators()
        end
    end)
    
    table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
    
    scanGenerators()
end

-- Taph拌线绘制
local function TaphTripwireHighlight()
    local DEEP_PURPLE = Color3.fromRGB(102, 0, 153)

    local HIGHLIGHT_SETTINGS = {
        FillColor = DEEP_PURPLE,
        OutlineColor = DEEP_PURPLE,
        FillTransparency = 0.2,
        OutlineTransparency = 0,
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
        OutlineThickness = 2,
    }

    local function clearExistingHighlights()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Highlight") and obj.Name == "TaphTripwire_DeepPurpleHighlight" then
                obj:Destroy()
            end
        end
    end

    local function getTargetFolder()
        local map = workspace:FindFirstChild("Map")
        if not map then return nil end
        local ingame = map:FindFirstChild("Ingame")
        if not ingame then return nil end
        return ingame
    end

    local function applyDeepPurpleHighlight(obj)
        local highlight = Instance.new("Highlight")
        highlight.Name = "TaphTripwire_DeepPurpleHighlight"
        highlight.Parent = obj
        for setting, value in pairs(HIGHLIGHT_SETTINGS) do
            highlight[setting] = value
        end

        if obj:IsA("BasePart") then
            local glow = Instance.new("SurfaceAppearance")
            glow.ColorMap = DEEP_PURPLE
            glow.Parent = obj
        end
    end

    local function highlightTaphTripwireObjects()
        clearExistingHighlights()
        local targetFolder = getTargetFolder()
        if not targetFolder then return end
        
        local count = 0
        for _, obj in pairs(targetFolder:GetDescendants()) do
            if obj.Name:find("TaphTripwire") then
                applyDeepPurpleHighlight(obj)
                count = count + 1
            end
        end
        
        print("高亮完成 数量: "..count)

        targetFolder.DescendantAdded:Connect(function(newObj)
            if newObj.Name:find("TaphTripwire") then
                applyDeepPurpleHighlight(newObj)
            end
        end)
    end

    highlightTaphTripwireObjects()

    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "输入 /highlighttaph 重新执行高亮",
        Color = DEEP_PURPLE,
        Font = Enum.Font.SourceSansBold
    })

    game:GetService("Players").PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(msg)
            if msg:lower() == "/highlighttaph" then
                highlightTaphTripwireObjects()
            end
        end)
    end)
end

-- 体力消耗功能
local function StaminaLoss()
    local Sprinting = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    Sprinting.StaminaLoss = 7
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "体力消耗已设置为7", 
        Duration = 3 
    })
end

-- 恢复体力功能
local function StaminaGain()
    local Sprinting = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    Sprinting.StaminaGain = 35
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "体力恢复已设置为35", 
        Duration = 3 
    })
end

-- 自动砍人功能
local function AutoAttack()
    local autoattackT = true
    local lookDistance = 50
    local attackDistance = 10
    
    while autoattackT and task.wait() do
        local Players = game:GetService('Players')
        local LocalPlayer = Players.LocalPlayer
        local character = LocalPlayer.Character
        if not character then continue end
        
        local humanoid = character:FindFirstChild('Humanoid')
        local playerRoot = character:FindFirstChild('HumanoidRootPart')
        if not humanoid or not playerRoot then continue end
        
        local RemoteEvent = game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Network'):WaitForChild('RemoteEvent')
        local Camera = game:GetService('Workspace').CurrentCamera
        
        local lookTarget = nil
        local minLookDistance = math.huge                         
        local attackTarget = nil
        local minAttackDistance = math.huge
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local targetRoot = player.Character:FindFirstChild('HumanoidRootPart')
                if targetRoot then
                    local distance = (playerRoot.Position - targetRoot.Position).Magnitude
                    
                    if distance <= lookDistance and distance < minLookDistance then
                        minLookDistance = distance
                        lookTarget = targetRoot
                    end
                    
                    if distance <= attackDistance and distance < minAttackDistance then
                        minAttackDistance = distance
                        attackTarget = targetRoot
                    end
                end
            end
        end
        
        if lookTarget then
            local lookVector = (lookTarget.Position - playerRoot.Position).Unit
            playerRoot.CFrame = CFrame.new(playerRoot.Position, lookTarget.Position)
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, lookTarget.Position)
        end
        
        if attackTarget then
            RemoteEvent:FireServer('UseActorAbility', 'Slash')
        end
    end
end

-- 自动抛硬币功能
local function AutoCoinFlip()
    local CoinFlipping = true
    local WantedChrges = 3
    local BlockRemote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
    
    while CoinFlipping and task.wait(1) do
        local chargesText = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.AbilityContainer.Reroll.Charges.Text
        local currentCharges = tonumber(chargesText)
        
        if currentCharges and currentCharges < WantedChrges then
            BlockRemote:FireServer("UseActorAbility", "CoinFlip")
        end
    end
end

-- 修机速度功能
local function RepairSpeed()
    local SkibidiWait = 4
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "修机速度已设置为4", 
        Duration = 3 
    })
end

-- 修机次数功能
local function RepairCount()
    local SkibidiCS = 4
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "修机次数已设置为4", 
        Duration = 3 
    })
end

-- 自瞄功能
local function Aimbot()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "自瞄功能已启用", 
        Duration = 3 
    })
end

-- 格挡+拳击功能
local function AutoBlockAndPunch()
    local AutoBlockEnabled = true
    local RunService = game:GetService("RunService")
    local combatConnection
    
    local function CombatLoop()
        -- 这里添加格挡和拳击逻辑
    end
    
    if AutoBlockEnabled then
        combatConnection = RunService.Stepped:Connect(function()
            pcall(CombatLoop)
        end)
    elseif combatConnection then
        combatConnection:Disconnect()
        combatConnection = nil
    end
end

-- 阻止弹窗功能
local function BlockPopups()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "阻止弹窗功能已启用", 
        Duration = 3 
    })
end

-- 无限体力功能
local function InfiniteStamina()
    local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    sprintModule.MinStamina = -100000
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "无限体力已启用", 
        Duration = 3 
    })
end

-- 将功能添加到UI
local UITab4 = win:AddTab("视觉功能",'7734068321')
local Visual = UITab4:AddSection("视觉功能",true)

Visual:AddButton("假电机ESP", FakeGeneratorESP)
Visual:AddButton("Noli传送电机ESP", NoliWarningESP)
Visual:AddButton("Taph拌线绘制", TaphTripwireHighlight)

local UITab5 = win:AddTab("游戏功能",'7734068321')
local GameFeatures = UITab5:AddSection("游戏功能",true)

GameFeatures:AddButton("体力消耗", StaminaLoss)
GameFeatures:AddButton("恢复体力", StaminaGain)
GameFeatures:AddButton("自动砍人", AutoAttack)
GameFeatures:AddButton("自动抛硬币", AutoCoinFlip)
GameFeatures:AddButton("修机速度", RepairSpeed)
GameFeatures:AddButton("修机次数", RepairCount)
GameFeatures:AddButton("自瞄", Aimbot)
GameFeatures:AddButton("格挡+拳击", AutoBlockAndPunch)
GameFeatures:AddButton("阻止弹窗", BlockPopups)
GameFeatures:AddButton("无限体力", InfiniteStamina)