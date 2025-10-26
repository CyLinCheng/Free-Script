local hakariactive = false
local quietactive = false
local stam = false
local connection
local chanceaim = false
local chanceaimbotLoop
local jasonaimbotloop
local genshouldloop = false
local genactive = false
local aimbot1x1loop
local johnloop
local guestloop
local shedloop
local player = game.Players.LocalPlayer
local aimbot1x1 = false
local johnaim = false
local connection
local jasonaim = false
local shedaim = false
local guestaim = false
local isHighlightActive = false
local toolhighlightactive = false
local hawktuahactive = false
local isCorruptNatureEspActive = false
local isSurvivorUtilEspActive = false
local run = false
local delay
local isSurvivorHighlightActive = false
local givepizza = false
local connections = {}
local isKillerHighlightActive = false
local hideplayerbar = false
local VirtualBallsManager = game:GetService('VirtualInputManager')
local jumppowerenabled = false

local function toggleHighlightGen(state)
    isHighlightActive = state 

    local function applyGeneratorHighlight(generator)
        if generator.Name == "Generator" then
            local existingHighlight = generator:FindFirstChild("GeneratorHighlight")
            local progress = generator:FindFirstChild("Progress")
            
            if isHighlightActive then
                if not existingHighlight then
                    local genhighlight = Instance.new("Highlight")
                    genhighlight.Parent = generator
                    genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    genhighlight.Name = "GeneratorHighlight"
                end
            else
                if existingHighlight then
                    existingHighlight:Destroy()
                end
                return
            end

            if progress then
                if progress.Value == 100 then
                    local highlight = generator:FindFirstChild("GeneratorHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                    return
                end

                progress:GetPropertyChangedSignal("Value"):Connect(function()
                    if progress.Value == 100 then
                        local highlight = generator:FindFirstChild("GeneratorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    elseif isHighlightActive and not generator:FindFirstChild("GeneratorHighlight") then
                        local genhighlight = Instance.new("Highlight")
                        genhighlight.Parent = generator
                        genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        genhighlight.Name = "GeneratorHighlight"
                    end
                end)
            end
        end
    end

    for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
        applyGeneratorHighlight(v)
    end

    game.Workspace.Map.Ingame.Map.ChildAdded:Connect(function(child)
        applyGeneratorHighlight(child)
    end)
end

local function togglehidebar(state)
    hideplayerbar = state 
    local playergui = player.PlayerGui
    local playerinfo = playergui.TemporaryUI.PlayerInfo

    if hideplayerbar then
        playerinfo.CurrentSurvivors.Visible = false
        playerinfo.PlayerIcon.Image = "rbxassetid://12549056837"
    else
        playerinfo.CurrentSurvivors.Visible = true
    end
end

local function hawktuahmode(state)
    if player.Character.Name ~= "c00lkidd" then
        return 
    end
    local TS = game:GetService("TweenService")
    hawktuahactive = state
    if state then
    end

    game.DescendantAdded:Connect(function(descendant)
        for _, v in pairs(hawktuahactivatesound) do
            if descendant.Name == v then
                if hawktuahactive then
                    local propout = {
                        ImageTransparency = 1
                    }

                    local propin = {
                        ImageTransparency = 0
                    }

                    local screengui = Instance.new("ScreenGui")
                    local frame = Instance.new("Frame")
                    local image = Instance.new("ImageLabel")
                    local sound = Instance.new("Sound")
                    sound.Parent = game.Workspace
                    sound.SoundId = "rbxassetid://17787027130"
                    sound:Play()

                    screengui.Parent = game.Players.LocalPlayer.PlayerGui
                    screengui.IgnoreGuiInset = true
                    frame.Parent = screengui
                    image.Parent = frame

                    frame.Size = UDim2.new(1,0,1,0)
                    frame.Position = UDim2.new(0, 0, 0, 0)
                    frame.BackgroundTransparency = 1

                    image.Size = UDim2.new(1,0,1,0)
                    image.Position = UDim2.new(0, 0, 0, 0)
                    image.BackgroundTransparency = 1

                    image.Image = "http://www.roblox.com/asset/?id=100505038126957"

                    local tweeninfoI = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    local tween = TS:Create(image,tweeninfoI, propout)
                    tween:play()

                    wait(1)

                    local tweeninfoII = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                    local tweenI = TS:Create(image,tweeninfoII, propin)
                    tweenI:play()
                    screengui:Destroy()
                end
            end
        end
    end)
end

local function Do1x1x1x1Popups()
    while true do
        if Do1x1PopupsLoop then
            local player = game:GetService("Players").LocalPlayer
            local popups = player.PlayerGui.TemporaryUI:GetChildren()

            for _, i in ipairs(popups) do
                if i.Name == "1x1x1x1Popup" then
                    local centerX = i.AbsolutePosition.X + (i.AbsoluteSize.X / 2)
                    local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2)
    
                    VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, player.PlayerGui, 1)
                    VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, player.PlayerGui, 1)
                end
            end
        end
        task.wait(0.1)
    end
end

local function instantsolvegen()
    for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
        if v.name == "Generator" then
            local num = 0
            repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
            until num == 4
        end
    end
end

local function solvegen()
    for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
        if v.name == "Generator" then
            v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
        end
    end
end

local function instantsolvegenhell()
    for i, v in pairs(game.Workspace.Map.Ingame.Map.Generators:GetChildren()) do
        if v:IsA("Model") then
            local num = 0
            repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
            until num == 4
        end
    end
end

local function highlighttools(state)
    toolhighlightActive = state
    
    local function applyHighlight(tool)
        if toolhighlightActive then
            local existinghighlight = tool:FindFirstChild("ToolHighlight")
            if not existinghighlight then
                local toolhighlight = Instance.new("Highlight")
                toolhighlight.Name = "ToolHighlight"
                toolhighlight.Parent = tool
                toolhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                if tool.Name == "Medkit" then
                    toolhighlight.FillColor = Color3.fromRGB(0, 255, 0)
                elseif tool.Name == "BloxyCola" then
                    toolhighlight.FillColor = Color3.fromRGB(88, 57, 39)
                end
            end
        else
            local existinghighlight = tool:FindFirstChild("ToolHighlight")
            if existinghighlight then
                existinghighlight:Destroy()
            end
        end
    end
    
    for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Tool") then
            applyHighlight(v)
        end
    end
    
    game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            applyHighlight(child)
        end
    end)
end

local function givemesomepizza(state)
    if not state then
        for _, v in pairs(connections) do
            v:Disconnect()
        end
        table.clear(connections)
        return
    end

    local function tp(child)
        if child:IsA("BasePart") and child.Name == "Pizza" then
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    child.CFrame = hrp.CFrame
                end
            end
        end
    end

    local function watchtower()
        local map = workspace:FindFirstChild("Map")
        local insession = map and map:FindFirstChild("Ingame")

        if insession then
            for _, child in pairs(insession:GetChildren()) do
                tp(child)
            end
            table.insert(connections, insession.ChildAdded:Connect(tp))
        end
    end

    watchtower()
end

local function setdelay(value)
    delay = value
end

local function autogen(state)
    run = state
    local debounce = {}

    while run do
        task.wait()
        for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if v.Name == "Generator" then
                if not debounce[v] then
                    debounce[v] = true
                    v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                    task.delay(delay, function() debounce[v] = nil end)
                end
            end
        end
    end
end

local function corruptnatureesp(state)
    isCorruptNatureEspActive = state
    for i, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Model") then
            local existingHighlight = v:FindFirstChild("CorruptNatureHighlight")
            if isCorruptNatureEspActive then
                if not existingHighlight then
                    if v.Name == "HumanoidRootProjectile" or v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3" then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "CorruptNatureHighlight"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = v
                    end
                end
            else
                if existingHighlight then
                    existingHighlight:Destroy()
                end
            end
        end
    end
end

local function survivorutilesp(state)
    isSurvivorUtilEspActive = state
    
    local function applySurvivorUtilHighlight(model)
        local existingHighlight = model:FindFirstChild("SurvivorUtilHighlight")
        if isSurvivorUtilEspActive then
            if not existingHighlight then
                for _, util in pairs(survivorutil) do
                    if model.Name == util then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "SurvivorUtilHighlight"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255,255,255)
                        highlight.FillTransparency = 0.5
                        highlight.Parent = model
                    end
                end
            end
        else
            if existingHighlight then
                existingHighlight:Destroy()
            end
        end
    end
    
        for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Model") or v:IsA("Part") then
            applySurvivorUtilHighlight(v)
        end
    end
    
    game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
        if child:IsA("Model") or child:IsA("Part") then
            applySurvivorUtilHighlight(child)
        end
    end)
end

local function activatethehakari(state)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")

    hakariactive = state

    if hakariactive then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0

        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = rootPart

        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://138019937280193"
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://87166578676888"
        sound.Parent = rootPart
        sound.Volume = 0.5
        sound.Looped = true
        sound:Play()

        local effect = game.ReplicatedStorage.Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
        effect.Name = "PlayerEmoteVFX"
        effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
        effect.WeldConstraint.Part0 = char.PrimaryPart
        effect.WeldConstraint.Part1 = effect
        effect.Parent = char
        effect.CanCollide = false

        local args = {
            [1] = "PlayEmote",
            [2] = "Animations",
            [3] = "HakariDance"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

        animationTrack.Stopped:Connect(function()
            humanoid.PlatformStand = false
            if bodyVelocity and bodyVelocity.Parent then
                bodyVelocity:Destroy()
            end
        end)
    else
        humanoid.PlatformStand = false
        humanoid.JumpPower = 0 

        local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        local sound = rootPart:FindFirstChildOfClass("Sound")
        if sound then
            sound:Stop()
            sound:Destroy()
        end

        local effect = char:FindFirstChild("PlayerEmoteVFX")
        if effect then
            effect:Destroy()
        end

        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == "rbxassetid://138019937280193" then
                track:Stop()
            end
        end
    end
end

local function activatethesilly(state)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")
    sillyactive = state

    if sillyactive then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0
    
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = rootPart
    
        local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.Shucks)
        emoteScript.Created({Character = char})
    
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://74238051754912"
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://123236721947419"
        sound.Parent = rootPart
        sound.Volume = 0.5
        sound.Looped = false
        sound:Play()
    
        local args = {
            [1] = "PlayEmote",
            [2] = "Animations",
            [3] = "Shucks"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
        animationTrack.Stopped:Connect(function()
            humanoid.PlatformStand = false
            if bodyVelocity and bodyVelocity.Parent then
                bodyVelocity:Destroy()
            end
    
            local saw = char:FindFirstChild("Saw")
            if saw then saw:Destroy() end
    
            local playerHand = char:FindFirstChild("PlayerEmoteHand")
            if playerHand then playerHand:Destroy() end
        end)
    else
        humanoid.PlatformStand = false
        humanoid.JumpPower = 0

        local saw = char:FindFirstChild("Saw")
        if saw then saw:Destroy() end

        local playerHand = char:FindFirstChild("PlayerEmoteHand")
        if playerHand then playerHand:Destroy() end

        local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        local sound = rootPart:FindFirstChildOfClass("Sound")
        if sound then
            sound:Stop()
            sound:Destroy()
        end

        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                track:Stop()
            end
        end
    end
end

local function activatethequiet(state)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")
    sillyactive = state

    if sillyactive then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0
    
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = rootPart
    
        local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.MissTheQuiet)
        emoteScript.Created({Character = char})
    
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://100986631322204"
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://131936418953291"
        sound.Parent = rootPart
        sound.Volume = 0.5
        sound.Looped = false
        sound:Play()
    
        local args = {
            [1] = "PlayEmote",
            [2] = "Animations",
            [3] = "MissTheQuiet"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
        animationTrack.Stopped:Connect(function()
            humanoid.PlatformStand = false
            if bodyVelocity and bodyVelocity.Parent then
                bodyVelocity:Destroy()
            end
    
            local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
            for _, assetName in ipairs(assetsToDestroy) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end
        end)
    else
        humanoid.PlatformStand = false
        humanoid.JumpPower = 0
    
        local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
        for _, assetName in ipairs(assetsToDestroy) do
            local asset = char:FindFirstChild(assetName)
            if asset then asset:Destroy() end
        end
    
        local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
    
        local sound = rootPart:FindFirstChildOfClass("Sound")
        if sound then
            sound:Stop()
            sound:Destroy()
        end
    
        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == "rbxassetid://100986631322204" then
                track:Stop()
            end
        end
    end
end

local function activatethesilly2(state)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")

    sillyactive = state

    if sillyactive then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0

        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = rootPart

        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://74238051754912"
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://123236721947419"
        sound.Parent = rootPart
        sound.Volume = 0.5
        sound.Looped = false
        sound:Play()

        local args = {
            [1] = "PlayEmote",
            [2] = "Animations",
            [3] = "Shucks"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

        animationTrack.Stopped:Connect(function()
            humanoid.PlatformStand = false
            if bodyVelocity and bodyVelocity.Parent then
                bodyVelocity:Destroy()
            end
        end)
    else
        humanoid.PlatformStand = false
        humanoid.JumpPower = 0

        local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        local sound = rootPart:FindFirstChildOfClass("Sound")
        if sound then
            sound:Stop()
            sound:Destroy()
        end

        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                track:Stop()
            end
        end
    end
end

local function survivorHighlighter(state)
    isSurvivorHighlightActive = state

    local function applySurvivorHighlight(model)
        if model:IsA("Model") and model:FindFirstChild("Head") then
            local existingBillboard = model.Head:FindFirstChild("billboard")
            local existingHighlight = model:FindFirstChild("HiThere")
            
            if isSurvivorHighlightActive then
                if not existingBillboard then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "billboard"
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = model.Head
                    
                    local textLabel = Instance.new("TextLabel", billboard)
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Text = model.Name
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.TextStrokeTransparency = 0
                    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    textLabel.BackgroundTransparency = 1
                end

                if not existingHighlight then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "HiThere"
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    highlight.Parent = model
                end
            else
                if existingBillboard then
                    existingBillboard:Destroy()
                end
                if existingHighlight then
                    existingHighlight:Destroy()
                end
            end
        end
    end

    for _, v in pairs(game.Workspace.Players.Survivors:GetChildren()) do
        applySurvivorHighlight(v)
    end

    game.Workspace.Players.Survivors.ChildAdded:Connect(function(child)
        applySurvivorHighlight(child)
    end)
end

local function killerHighlighter(state)
    isKillerHighlightActive = state

    local function applyKillerHighlight(model)
        if model:IsA("Model") and model:FindFirstChild("Head") then
            local existingBillboard = model.Head:FindFirstChild("billboard")
            local existingHighlight = model:FindFirstChild("HiThere")
            
            if isKillerHighlightActive then
                if not existingBillboard then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "billboard"
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = model.Head
                    
                    local textLabel = Instance.new("TextLabel", billboard)
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Text = model.Name
                    textLabel.TextColor3 = Color3.new(1, 0, 0)
                    textLabel.TextStrokeTransparency = 0
                    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    textLabel.BackgroundTransparency = 1
                end

                if not existingHighlight then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "HiThere"
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.Parent = model
                end
            else
                if existingBillboard then
                    existingBillboard:Destroy()
                end
                if existingHighlight then
                    existingHighlight:Destroy()
                end
            end
        end
    end
    for _, v in pairs(game.Workspace.Players.Killers:GetChildren()) do
        applyKillerHighlight(v)
    end

    game.Workspace.Players.Killers.ChildAdded:Connect(function(child)
        applyKillerHighlight(child)
    end)
end

local function bringbackjumppower(state)
    jumppowerenabled = state

    if jumppowerenabled then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
    end
end

local function speedmulti(value)
    game.Players.LocalPlayer.Character.SpeedMultipliers.Sprinting.Value = value
end

local function bringbackjumppowerslider(value)
    if jumppowerenabled then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    else
        return
    end
end

local function FOVmulti(value)
    game.Players.LocalPlayer.Character.FOVMultipliers.FOVSetting.Value = value
end

local function kaiguyskin()      
    if player.Character.Name ~= "Guest1337" then
        return 
    end
    for _, v in pairs(player.Character:GetChildren()) do
        if v:IsA("Shirt") then
            v:Destroy()
        end

        if v:IsA("Pants") then
            v:Destroy()
        end

        local headband = Instance.new("Accessory")
        local scarf = Instance.new("Accessory")
        local shirt = Instance.new("Shirt")
        local pants = Instance.new("Pants")
        
        local headbandhandle = Instance.new("Part")
        local scarfhandle = Instance.new("Part")
        local headbandhandleattach = Instance.new("Attachment")
        local scarfhandleattach = Instance.new("Attachment")
        local headbandweld = Instance.new("Weld")
        local scarfweld = Instance.new("Weld")
        scarfhandle.Name = "Handle"
        headbandhandle.Name = "Handle"
        scarfhandle.CanCollide = false
        headbandhandle.CanCollide = false
        
        local headbandmesh = Instance.new("SpecialMesh")
        local scarfmesh = Instance.new("SpecialMesh")
        
        shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=836903658"
        pants.PantsTemplate = "http://www.roblox.com/asset/?id=731578592"
        shirt.Parent = player.Character
        pants.Parent = player.Character
        
        headband.Parent = player.Character
        scarf.Parent = player.Character
        scarfhandle.Parent = scarf
        headbandhandle.Parent = headband
        headbandhandleattach.Parent = headbandhandle
        scarfhandleattach.Parent = scarfhandle
        headbandmesh.Parent = headbandhandle
        scarfmesh.Parent = scarfhandle
        headbandhandle.Color = Color3.fromRGB(27, 42, 53)
        scarfhandle.Color = Color3.fromRGB(27, 42, 53)
        
        headbandweld.Parent = headbandhandle
        headbandweld.Name = "AccessoryWeld"
        headbandweld.Part0 = headbandhandle
        headbandweld.Part1 = player.Character.Head
        headbandweld.C0 = CFrame.new(0, 0, 0)
        headbandweld.C1 = CFrame.new(0, 0, 0)
        
        scarfweld.Parent = scarfhandle
        scarfweld.Name = "AccessoryWeld"
        scarfweld.Part0 = scarfhandle
        scarfweld.Part1 = player.Character.Torso
        scarfweld.C0 = CFrame.new(0, -0.4, 0)
        scarfweld.C1 = CFrame.new(0, 0, 0)
        
        headbandmesh.MeshId = "http://www.roblox.com/asset/?id=20407184"
        headbandmesh.Scale = Vector3.new(1.103, 1.071, 1.103)
        scarfmesh.MeshId = "http://www.roblox.com/asset/?id=99856331"
        scarfmesh.Scale = Vector3.new(1.071, 1.071, 1.071)
        scarfmesh.VertexColor = Vector3.new(1, 2, 1)
        
        headbandhandleattach.Name = "HatAttachment"
        headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)
        scarfhandleattach.Name = "NeckAttachment"
        scarfhandleattach.CFrame = CFrame.new(0, 0.519, 0)

        local playergui = player.PlayerGui
        local playerinfo = playergui.TemporaryUI.PlayerInfo

        playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=97047410245118"
    end
end

local function doomskin()      
    if player.Character.Name ~= "Shedletsky" then
        return 
    end
    for _, v in pairs(player.Character:GetChildren()) do
        if v:IsA("Shirt") then
            v:Destroy()
        end

        if v:IsA("Pants") then
            v:Destroy()
        end

        local headband = Instance.new("Accessory")
        local shirt = Instance.new("Shirt")
        local pants = Instance.new("Pants")
        local tshirt = Instance.new("ShirtGraphic")
        
        local headbandhandle = Instance.new("Part")
        local headbandhandleattach = Instance.new("Attachment")
        local headbandweld = Instance.new("Weld")
        headbandhandle.Name = "Handle"
        headbandhandle.CanCollide = false
        
        local headbandmesh = Instance.new("SpecialMesh")
        
        shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1808496"
        pants.PantsTemplate = "http://www.roblox.com/asset/?id=1809861"
        tshirt.Graphic = "http://www.roblox.com/asset/?id=2426992"
        shirt.Parent = player.Character
        pants.Parent = player.Character
        tshirt.Parent = player.Character
        
        headband.Parent = player.Character
        headbandhandle.Parent = headband
        headbandhandleattach.Parent = headbandhandle
        headbandmesh.Parent = headbandhandle
        headbandhandle.Color = Color3.fromRGB(27, 42, 53)
        
        headbandweld.Parent = headbandhandle
        headbandweld.Name = "AccessoryWeld"
        headbandweld.Part0 = headbandhandle
        headbandweld.Part1 = player.Character.Head
        headbandweld.C0 = CFrame.new(0, -0.5, 0)
        headbandweld.C1 = CFrame.new(0, 0, 0)
        
        headbandmesh.MeshId = "http://www.roblox.com/asset/?id=1286103"
        headbandmesh.TextureId = "rbxassetid://6858319251"
        headbandmesh.Scale = Vector3.new(0.992, 0.994, 0.992)
        if player.Character:FindFirstChild("ShedHair") then
            player.Character:FindFirstChild("ShedHair"):Destroy()
        end
        
        headbandhandleattach.Name = "HatAttachment"
        headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)

        local playergui = player.PlayerGui
        local playerinfo = playergui.TemporaryUI.PlayerInfo

        playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=118308385507069"
    end
end

local function chanceaimbot(state)
    chanceaim = state
    if game.Players.LocalPlayer.Character.Name ~= "Chance" and state then
        return 
    end
    if state then
        chanceaimbotLoop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not chanceaim then return end
            for _, v in pairs(chanceaimbotsounds) do
                if child.Name == v  then
                    local killer = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                    if killer and killer:FindFirstChild("HumanoidRootPart") then
                        local killerHRP = killer.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if playerHRP then
                            local direction = (killerHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100
                        
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(killerHRP.Position.X, killerHRP.Position.Y, killerHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if chanceaimbotLoop then
            chanceaimbotLoop:Disconnect()
            chanceaimbotLoop = nil
        end
    end
end

local function shedaimbot(state)
    shedaim = state
    if game.Players.LocalPlayer.Character.Name ~= "Shedletsky" and state then
        return
    end
    if state then
        shedloop = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not shedaim then return end
            for _, v in pairs(shedaimbotsounds) do
                if child.Name == v then
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local num = 1
                                local maxIterations = 100

                                while num <= maxIterations do
                                    task.wait(0.01)
                                    num = num + 1
                                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                    playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if shedloop then
            shedloop:Disconnect()
            shedloop = nil
        end
    end
end

local function guestaimbot(state)
    shedaim = state
    if game.Players.LocalPlayer.Character.Name ~= "Guest1337" and state then
        return
    end
    if state then
        shedloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not shedaim then return end
            for _, v in pairs(guestsounds) do
                if child.Name == v then
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local num = 1
                                local maxIterations = 100

                                while num <= maxIterations do
                                    task.wait(0.01)
                                    num = num + 1
                                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                    playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if guestloop then
            guestloop:Disconnect()
            guestloop = nil
        end
    end
end

local function aimbot1x1x1x1(state)
    aimbot1x1 = state

    if game.Players.LocalPlayer.Character.Name ~= "1x1x1x1" and state then
        return 
    end

    if state then
        aimbot1x1loop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not aimbot1x1 then return end
            for _, v in pairs(aimbot1x1sounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 

                            if child.Name == "rbxassetid://79782181585087" then
                                maxIterations = 220  
                            end

                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimbot1x1loop then
            aimbot1x1loop:Disconnect()
            aimbot1x1loop = nil
        end
    end
end

local function johnaimbot(state)
    johnaim = state
    if game.Players.LocalPlayer.Character.Name ~= "JohnDoe" and state then
        return 
    end
    if state then
        johnloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(johnaimbotsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = 330
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if johnloop then
            johnloop:Disconnect()
            johnloop = nil
        end
    end
end

local function jasonaimbot(state)
    jasonaim = state
    if game.Players.LocalPlayer.Character.Name ~= "Jason" and state then
        return 
    end
    if state then
        jasonaimbotloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not jasonaim then return end
            for _, v in pairs(jasonaimbotsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = 70
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if jasonaimbotloop then
            jasonaimbotloop:Disconnect()
            jasonaimbotloop = nil
        end
    end
end

local function staminadrainono(state)
    stam = state
    local stamscript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    
    while stam do
        stamscript.StaminaLossDisabled = true
        task.wait(1)
    end
    
    stamscript.StaminaLossDisabled = nil
end

local function unlockclientcharacters()
    local clone = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
    clone.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
    for i, v in pairs(clone:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
    end
    local clone2 = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
    clone2.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors
    for i, v in pairs(clone2:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lyyanai/rbx/main/AL"))()
local win = library:new("江Script Forsaken")

local VisualTab = win:Tab("视觉")
local gentab = win:Tab("发电机")
local chartab = win:Tab("杀手")
local survivortab = win:Tab("幸存者")
local blatanttab = win:Tab(" blatant")
local misctab = win:Tab("杂项")

local genSection = gentab:section("发电机", true)
genSection:Button("一键解决按钮", function()
    instantsolvegen()
end)

genSection:Button("Gen Hell 2 地图一键解决按钮", function()
    instantsolvegenhell()
end)

genSection:Button("单个谜题解决按钮", function()
    solvegen()
end)

genSection:Toggle("自动发电机", "", false, function(state)
    autogen(state)
end)

genSection:Toggle("发电机高亮", "", false, function(state)
    toggleHighlightGen(state)
end)

genSection:Keybind("解决当前发电机谜题", "H", function()
    solvegen()
end)

genSection:Slider("自动发电机延迟", "", 0.1, 0.1, 10, false, function(value)
    setdelay = value
end)

local visualSection = VisualTab:section("视觉", true)
visualSection:Toggle("工具高亮", "", false, function(state)
    highlighttools(state)
end)

visualSection:Toggle("幸存者高亮", "", false, function(state)
    survivorHighlighter(state)
end)

visualSection:Toggle("杀手高亮", "", false, function(state)
    killerHighlighter(state)
end)

visualSection:Toggle("C00lkidd ESP", "", false, function(state)
    corruptnatureesp(state)
end)

visualSection:Toggle("幸存者实用工具高亮", "", false, function(state)
    survivorutilesp(state)
end)

local miscSection = misctab:section("杂项", true)
miscSection:Button("解锁角色 [客户端]", function()
    unlockclientcharacters()
end)

miscSection:Toggle("Hakari 舞蹈", "", false, function(state)
    activatethehakari(state)
end)

miscSection:Toggle("Aw Shucks [付费版]", "", false, function(state)
    activatethesilly(state)
end)

miscSection:Toggle("Aw Shucks [免费版]", "", false, function(state)
    activatethesilly2(state)
end)

miscSection:Toggle("Miss the Quiet", "", false, function(state)
    activatethequiet(state)
end)

miscSection:Toggle("隐藏玩家栏", "", false, function(state)
    togglehidebar(state)
end)

miscSection:Slider("视野范围", "", 1, 1, 2, false, function(value)
    FOVmulti = value
end)

local survivorSection = survivortab:section("幸存者", true)
survivorSection:Button("Kai 1337 皮肤", function()
    kaiguyskin()
end)

survivorSection:Button("Doombringer Shed 皮肤", function()
    doomskin()
end)

survivorSection:Toggle("Chance 自瞄", "", false, function(state)
    chanceaimbot(state)
end)

survivorSection:Toggle("Shed 自瞄", "", false, function(state)
    shedaimbot(state)
end)

survivorSection:Toggle("Guest 自瞄", "", false, function(state)
    guestaimbot(state)
end)

survivorSection:Toggle("披萨传送", "", false, function(state)
    givemesomepizza(state)
end)

local killerSection = chartab:section("杀手", true)
killerSection:Toggle("C00lkid 自瞄", "", false, function(state)
    game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("SetDevice", state and "Mobile" or "PC")
end)

killerSection:Toggle("1x1x1x1 自瞄", "", false, function(state)
    aimbot1x1x1x1(state)
end)

killerSection:Toggle("即时弹出解决", "", false, function(state)
    Do1x1PopupsLoop = state and task.spawn(Do1x1x1x1Popups)
end)

local blatantSection = blatanttab:section("Blatant", true)
blatantSection:Toggle("John Doe 尖刺自瞄", "", false, function(state)
    johnaimbot(state)
end)

blatantSection:Toggle("Jason 自瞄 [不稳定，仅用技能击杀]", "", false, function(state)
    jasonaimbot(state)
end)

blatantSection:Toggle("无体力消耗", "", false, function(state)
    staminadrainono(state)
end)

blatantSection:Toggle("恢复跳跃能力", "", false, function(state)
    bringbackjumppower(state)
end)

blatantSection:Toggle("Hawk Tuah 模式", "", false, function(state)
    hawktuahmode(state)
end)

blatantSection:Slider("移动速度", "", 1, 1, 1000, false, function(value)
    speedmulti = value
end)

blatantSection:Slider("跳跃力量", "", 50, 1, 1000, false, function(value)
    bringbackjumppowerslider = value
end)