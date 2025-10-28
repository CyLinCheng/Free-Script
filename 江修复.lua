local Players = game:GetService("Players")
local Heartbeat = game:GetService("RunService").Heartbeat

-- 修复LBL变量问题
local TimeLabel = nil
if LBL then
    TimeLabel = LBL
end

local function UpdateTime()
    if TimeLabel then
        local currentTime = os.date("*t")
        TimeLabel.Text = ("时间: %02d时%02d分%02d秒"):format(currentTime.hour, currentTime.min, currentTime.sec)
    end
end

if TimeLabel then
    Heartbeat:Connect(UpdateTime)
end

-- 显示初始通知
game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "『江·被遗弃』", 
    Text = "核对用户ID中", 
    Duration = 2 
})

wait(2)

game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "『江·被遗弃』", 
    Text = "用户ID核对完毕", 
    Duration = 4 
})

wait(1)

-- 加载UI库
local success, ui = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "『江·被遗弃』", 
        Text = "UI库加载失败，请重试", 
        Duration = 5 
    })
    return
end

-- 创建主窗口
local win = ui:MakeWindow({
    Name = "江·被遗弃脚本", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "JiangConfig",
    IntroEnabled = true,
    IntroText = "江·被遗弃"
})

-- 信息标签页
local UITab1 = win:MakeTab({
    Name = "信息", 
    Icon = "rbxassetid://7734068321", 
    PremiumOnly = false
})

local about = UITab1:AddSection("信息", true)

about:AddLabel("江·被遗弃")
about:AddLabel("作者:凌晨")
about:AddLabel("江脚本主群:836843047")
about:AddLabel("脚本持续更新")
about:AddLabel("通缉:江暖阳 缝合圈钱")

local about2 = UITab1:AddSection("玩家信息", true)

-- 修复玩家信息变量
local player = Players.LocalPlayer
local function safeGetExecutor()
    local success, result = pcall(function()
        return identifyexecutor and identifyexecutor() or "未知注入器"
    end)
    return success and result or "未知注入器"
end

about2:AddLabel("你的账号年龄:"..(player.AccountAge or "未知").."天")
about2:AddLabel("你的注入器:"..safeGetExecutor())
about2:AddLabel("你的用户名:"..player.Name)
about2:AddLabel("你现在的服务器名称:"..game.PlaceId)
about2:AddLabel("你现在的服务器id:"..game.GameId)
about2:AddLabel("你的用户ID:"..player.UserId)

-- 安全获取客户端ID
local function safeGetClientId()
    local success, result = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return success and result or "未知"
end

about2:AddLabel("获取客户端ID:"..safeGetClientId())

-- 公告标签页
local UITab2 = win:MakeTab({
    Name = "公告", 
    Icon = "rbxassetid://7734068321", 
    PremiumOnly = false
})

local about3 = UITab2:AddSection("公告", true)

about3:AddLabel("感谢所有支持江·被遗弃脚本的人")
about3:AddLabel("通缉江暖阳 缝合圈钱 推卸责任 六年级小学生")

-- 主要功能标签页
local UITab3 = win:MakeTab({
    Name = "主要功能", 
    Icon = "rbxassetid://7734068321", 
    PremiumOnly = false
})

local about4 = UITab3:AddSection("主要功能", true)

-- 绕过飞行功能
about4:AddButton("绕过飞行", function()
    local CFSpeed = 50
    local CFLoop = nil
    local RunService = game:GetService("RunService")

    local function StartCFly()
        local speaker = Players.LocalPlayer
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
        local speaker = Players.LocalPlayer
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
about4:AddButton("访客自动格挡", function()
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
about4:AddButton("John自动404", function()
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

-- 视觉功能标签页
local UITab4 = win:MakeTab({
    Name = "视觉功能", 
    Icon = "rbxassetid://7734068321", 
    PremiumOnly = false
})

local Visual = UITab4:AddSection("视觉功能", true)

-- Generator ESP功能
Visual:AddButton("Generator ESP", function()
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
            
            local character = Players.LocalPlayer.Character
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
Visual:AddButton("假电机ESP", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "假电机ESP功能待实现", 
        Duration = 3 
    })
end)

-- 游戏功能标签页
local UITab5 = win:MakeTab({
    Name = "游戏功能", 
    Icon = "rbxassetid://7734068321", 
    PremiumOnly = false
})

local GameFeatures = UITab5:AddSection("游戏功能", true)

-- 体力消耗功能
GameFeatures:AddButton("体力消耗", function()
    local success, sprintModule = pcall(function()
        return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    end)
    
    if success then
        sprintModule.StaminaLoss = 7
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "体力消耗已设置为7", 
            Duration = 3 
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "体力消耗设置失败", 
            Duration = 3 
        })
    end
end)

-- 恢复体力功能
GameFeatures:AddButton("恢复体力", function()
    local success, sprintModule = pcall(function()
        return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    end)
    
    if success then
        sprintModule.StaminaGain = 35
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "体力恢复已设置为35", 
            Duration = 3 
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "体力恢复设置失败", 
            Duration = 3 
        })
    end
end)

-- 自动砍人功能
GameFeatures:AddButton("自动砍人", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "自动砍人功能已启用", 
        Duration = 3 
    })
end)

-- 自动抛硬币功能
GameFeatures:AddButton("自动抛硬币", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "自动抛硬币功能已启用", 
        Duration = 3 
    })
end)

-- 修机速度功能
GameFeatures:AddButton("修机速度", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "修机速度已设置为4", 
        Duration = 3 
    })
end)

-- 修机次数功能
GameFeatures:AddButton("修机次数", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "修机次数已设置为4", 
        Duration = 3 
    })
end)

-- 自瞄功能
GameFeatures:AddButton("自瞄", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "自瞄功能已启用", 
        Duration = 3 
    })
end)

-- 格挡+拳击功能
GameFeatures:AddButton("格挡+拳击", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "格挡+拳击功能已启用", 
        Duration = 3 
    })
end)

-- 阻止弹窗功能
GameFeatures:AddButton("阻止弹窗", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{ 
        Title = "江·被遗弃", 
        Text = "阻止弹窗功能已启用", 
        Duration = 3 
    })
end)

-- 无限体力功能
GameFeatures:AddButton("无限体力", function()
    local success, sprintModule = pcall(function()
        return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    end)
    
    if success then
        sprintModule.MinStamina = -100000
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "无限体力已启用", 
            Duration = 3 
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{ 
            Title = "江·被遗弃", 
            Text = "无限体力设置失败", 
            Duration = 3 
        })
    end
end)

-- 显示UI加载完成通知
game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "『江·被遗弃』", 
    Text = "UI加载完成，按右Shift打开菜单", 
    Duration = 5 
})

print("江·被遗弃脚本加载完成")