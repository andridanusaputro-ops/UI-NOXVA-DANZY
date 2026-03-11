-- ==========================================
-- NOXVA UI ENGINE | FOLDER & LABEL SUPPORT
-- ==========================================
local NoxvaLib = {}

function NoxvaLib:CreateWindow()
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local StatsService = game:GetService("Stats")
    local TweenService = game:GetService("TweenService") 

    if gethui then
        if gethui():FindFirstChild("NoxvaHub_Pure") then gethui().NoxvaHub_Pure:Destroy() end
    else
        if CoreGui:FindFirstChild("NoxvaHub_Pure") then CoreGui.NoxvaHub_Pure:Destroy() end
    end

    local NoxvaUI = Instance.new("ScreenGui")
    NoxvaUI.Name = "NoxvaHub_Pure"
    NoxvaUI.ResetOnSpawn = false 
    if gethui then NoxvaUI.Parent = gethui() else pcall(function() NoxvaUI.Parent = CoreGui end) end

    local NotifContainer = Instance.new("Frame", NoxvaUI)
    NotifContainer.Name = "NotifContainer"
    NotifContainer.Size = UDim2.new(0, 250, 1, -20)
    NotifContainer.Position = UDim2.new(1, -20, 0, 0)
    NotifContainer.AnchorPoint = Vector2.new(1, 0)
    NotifContainer.BackgroundTransparency = 1
    
    local NotifLayout = Instance.new("UIListLayout", NotifContainer)
    NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotifLayout.Padding = UDim.new(0, 10)

    local OpenLogo = Instance.new("Frame", NoxvaUI)
    OpenLogo.Size = UDim2.new(0, 50, 0, 50)
    OpenLogo.Position = UDim2.new(0.5, -25, 0, 20)
    OpenLogo.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    OpenLogo.BackgroundTransparency = 0.15
    OpenLogo.Visible = false 
    Instance.new("UICorner", OpenLogo).CornerRadius = UDim.new(1, 0)
    
    local LogoStroke = Instance.new("UIStroke", OpenLogo)
    LogoStroke.Color = Color3.fromRGB(0, 120, 255)
    LogoStroke.Thickness = 2
    
    local LogoImage = Instance.new("ImageLabel", OpenLogo)
    LogoImage.Size = UDim2.new(1, 0, 1, 0)
    LogoImage.BackgroundTransparency = 1
    LogoImage.Image = "rbxthumb://type=Asset&id=15648362575&w=150&h=150" 
    Instance.new("UICorner", LogoImage).CornerRadius = UDim.new(1, 0)
    
    local LogoClicker = Instance.new("TextButton", OpenLogo)
    LogoClicker.Size = UDim2.new(1, 0, 1, 0)
    LogoClicker.BackgroundTransparency = 1
    LogoClicker.Text = ""

    local FloatBg = Instance.new("Frame", OpenLogo)
    FloatBg.Position = UDim2.new(0.5, 0, 0, -35)
    FloatBg.AnchorPoint = Vector2.new(0.5, 0)
    FloatBg.Size = UDim2.new(0, 0, 0, 24)
    FloatBg.AutomaticSize = Enum.AutomaticSize.X 
    FloatBg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    FloatBg.BackgroundTransparency = 0.15
    Instance.new("UICorner", FloatBg).CornerRadius = UDim.new(1, 0)
    
    local FloatStroke = Instance.new("UIStroke", FloatBg)
    FloatStroke.Color = Color3.fromRGB(0, 120, 255)
    FloatStroke.Thickness = 1.5

    local FloatPad = Instance.new("UIPadding", FloatBg)
    FloatPad.PaddingLeft = UDim.new(0, 12)
    FloatPad.PaddingRight = UDim.new(0, 12)

    local FloatingStats = Instance.new("TextLabel", FloatBg)
    FloatingStats.Size = UDim2.new(0, 0, 1, 0)
    FloatingStats.AutomaticSize = Enum.AutomaticSize.X
    FloatingStats.BackgroundTransparency = 1
    FloatingStats.TextColor3 = Color3.fromRGB(0, 255, 150)
    FloatingStats.Font = Enum.Font.GothamBold
    FloatingStats.TextSize = 11

    local MainFrame = Instance.new("Frame", NoxvaUI)
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.15 
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
    
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(40, 40, 40)
    MainStroke.Thickness = 1

    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBar.BackgroundTransparency = 0.15
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)
    
    local TopBarBlocker = Instance.new("Frame", TopBar)
    TopBarBlocker.Size = UDim2.new(1, 0, 0, 10)
    TopBarBlocker.Position = UDim2.new(0, 0, 1, -10)
    TopBarBlocker.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBarBlocker.BackgroundTransparency = 0.15
    TopBarBlocker.BorderSizePixel = 0

    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.Size = UDim2.new(0, 200, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "NOXVA HUB | PREMIUM"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local TopBarStats = Instance.new("TextLabel", TopBar)
    TopBarStats.Size = UDim2.new(0, 150, 1, 0)
    TopBarStats.Position = UDim2.new(0.5, -75, 0, 0)
    TopBarStats.BackgroundTransparency = 1
    TopBarStats.TextColor3 = Color3.fromRGB(0, 255, 150)
    TopBarStats.Font = Enum.Font.GothamMedium
    TopBarStats.TextSize = 12

    local frames, lastUpdate = 0, tick()
    RunService.RenderStepped:Connect(function()
        frames = frames + 1
        if tick() - lastUpdate >= 1 then
            local currentPing = 0
            pcall(function() currentPing = math.round(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            local statText = "FPS: " .. frames .. " | Ping: " .. currentPing .. "ms"
            TopBarStats.Text = statText
            FloatingStats.Text = statText
            frames = 0
            lastUpdate = tick()
        end
    end)

    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 20
    CloseBtn.MouseButton1Click:Connect(function() NoxvaUI:Destroy() end)

    local MinBtn = Instance.new("TextButton", TopBar)
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -70, 0, 5)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 24
    MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; OpenLogo.Visible = true end)
    LogoClicker.MouseButton1Click:Connect(function() MainFrame.Visible = true; OpenLogo.Visible = false end)

    local function MakeDraggable(UIElement, DragHandle)
        local dragging, dragInput, dragStart, startPos
        DragHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; dragStart = input.Position; startPos = UIElement.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        DragHandle.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                UIElement.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end
    MakeDraggable(MainFrame, TopBar)
    MakeDraggable(OpenLogo, LogoClicker)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 130, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Sidebar.BackgroundTransparency = 0.2
    Sidebar.BorderSizePixel = 0
    
    local SidebarLayout = Instance.new("UIListLayout", Sidebar)
    SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SidebarLayout.Padding = UDim.new(0, 5)

    local ContentArea = Instance.new("Frame", MainFrame)
    ContentArea.Size = UDim2.new(1, -130, 1, -40)
    ContentArea.Position = UDim2.new(0, 130, 0, 40)
    ContentArea.BackgroundTransparency = 1

    local WindowFunctions = {}
    local FirstTab = true

    function WindowFunctions:Notify(Title, Text, Duration)
        local NotifFrame = Instance.new("Frame", NotifContainer)
        NotifFrame.Size = UDim2.new(1, 0, 0, 60)
        NotifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        NotifFrame.BackgroundTransparency = 0.1
        NotifFrame.Position = UDim2.new(1, 300, 0, 0)
        Instance.new("UICorner", NotifFrame).CornerRadius = UDim.new(0, 5)

        local NStroke = Instance.new("UIStroke", NotifFrame)
        NStroke.Color = Color3.fromRGB(0, 120, 255)
        NStroke.Thickness = 1.5

        local NotifTitle = Instance.new("TextLabel", NotifFrame)
        NotifTitle.Size = UDim2.new(1, -20, 0, 20)
        NotifTitle.Position = UDim2.new(0, 10, 0, 5)
        NotifTitle.BackgroundTransparency = 1
        NotifTitle.Text = Title
        NotifTitle.TextColor3 = Color3.fromRGB(0, 120, 255)
        NotifTitle.Font = Enum.Font.GothamBold
        NotifTitle.TextSize = 13
        NotifTitle.TextXAlignment = Enum.TextXAlignment.Left

        local NotifDesc = Instance.new("TextLabel", NotifFrame)
        NotifDesc.Size = UDim2.new(1, -20, 0, 30)
        NotifDesc.Position = UDim2.new(0, 10, 0, 25)
        NotifDesc.BackgroundTransparency = 1
        NotifDesc.Text = Text
        NotifDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
        NotifDesc.Font = Enum.Font.GothamSemibold
        NotifDesc.TextSize = 12
        NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotifDesc.TextWrapped = true

        TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()

        task.delay(Duration or 3, function()
            local fadeOut = TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 0, 0)})
            fadeOut:Play()
            fadeOut.Completed:Connect(function() NotifFrame:Destroy() end)
        end)
    end

    function WindowFunctions:MakeTab(TabName)
        local TabBtn = Instance.new("TextButton", Sidebar)
        TabBtn.Size = UDim2.new(1, 0, 0, 35)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = TabName
        TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextSize = 13
        TabBtn.BorderSizePixel = 0
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        local TabPad = Instance.new("UIPadding", TabBtn)
        TabPad.PaddingLeft = UDim.new(0, 15)

        local TabPage = Instance.new("ScrollingFrame", ContentArea)
        TabPage.Size = UDim2.new(1, -20, 1, -20)
        TabPage.Position = UDim2.new(0, 10, 0, 10)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 0 
        TabPage.Visible = FirstTab
        TabPage.BorderSizePixel = 0

        if FirstTab then TabBtn.TextColor3 = Color3.fromRGB(0, 120, 255); FirstTab = false end

        local PageLayout = Instance.new("UIListLayout", TabPage)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 6)
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
        end)

        TabBtn.MouseButton1Click:Connect(function()
            for _, child in pairs(ContentArea:GetChildren()) do if child:IsA("ScrollingFrame") then child.Visible = false end end
            for _, child in pairs(Sidebar:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(150, 150, 150) end end
            TabPage.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(0, 120, 255)
        end)

        local TabFunctions = {}

        -- FITUR BARU 1: KOTAK LABEL (Buat Info & Notes)
        function TabFunctions:AddLabel(TextContent)
            local LblFrame = Instance.new("Frame", TabPage)
            LblFrame.Size = UDim2.new(1, 0, 0, 0)
            LblFrame.AutomaticSize = Enum.AutomaticSize.Y
            LblFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            LblFrame.BackgroundTransparency = 0.2
            Instance.new("UICorner", LblFrame).CornerRadius = UDim.new(0, 5)

            local LblText = Instance.new("TextLabel", LblFrame)
            LblText.Size = UDim2.new(1, 0, 0, 0)
            LblText.AutomaticSize = Enum.AutomaticSize.Y
            LblText.BackgroundTransparency = 1
            LblText.Text = TextContent
            LblText.TextColor3 = Color3.fromRGB(220, 220, 220)
            LblText.Font = Enum.Font.GothamSemibold
            LblText.TextSize = 12
            LblText.TextWrapped = true
            LblText.TextXAlignment = Enum.TextXAlignment.Left
            LblText.TextYAlignment = Enum.TextYAlignment.Top
            
            local Pad = Instance.new("UIPadding", LblText)
            Pad.PaddingLeft = UDim.new(0, 15)
            Pad.PaddingRight = UDim.new(0, 15)
            Pad.PaddingTop = UDim.new(0, 10)
            Pad.PaddingBottom = UDim.new(0, 10)

            local LabelItem = {}
            function LabelItem:SetText(newText) LblText.Text = newText end
            return LabelItem
        end

        -- FITUR BARU 2: FOLDER MENU COLLAPSIBLE (Kayak Seraphin)
        function TabFunctions:AddFolder(TitleText)
            local FolderFrame = Instance.new("Frame", TabPage)
            FolderFrame.Size = UDim2.new(1, 0, 0, 35)
            FolderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            FolderFrame.BackgroundTransparency = 0.2
            FolderFrame.ClipsDescendants = true
            Instance.new("UICorner", FolderFrame).CornerRadius = UDim.new(0, 5)

            local FolderBtn = Instance.new("TextButton", FolderFrame)
            FolderBtn.Size = UDim2.new(1, 0, 0, 35)
            FolderBtn.BackgroundTransparency = 1
            FolderBtn.Text = TitleText .. "   ▼"
            FolderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            FolderBtn.Font = Enum.Font.GothamBold
            FolderBtn.TextSize = 13
            FolderBtn.TextXAlignment = Enum.TextXAlignment.Left
            local FPad = Instance.new("UIPadding", FolderBtn)
            FPad.PaddingLeft = UDim.new(0, 15)

            local ItemContainer = Instance.new("Frame", FolderFrame)
            ItemContainer.Size = UDim2.new(1, 0, 1, -35)
            ItemContainer.Position = UDim2.new(0, 0, 0, 35)
            ItemContainer.BackgroundTransparency = 1

            local ItemLayout = Instance.new("UIListLayout", ItemContainer)
            ItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ItemLayout.Padding = UDim.new(0, 5)
            
            local CPad = Instance.new("UIPadding", ItemContainer)
            CPad.PaddingTop = UDim.new(0, 5)
            CPad.PaddingBottom = UDim.new(0, 5)

            local isOpen = false
            FolderBtn.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                FolderBtn.Text = TitleText .. (isOpen and "   ▲" or "   ▼")
                if isOpen then
                    FolderFrame.Size = UDim2.new(1, 0, 0, 35 + ItemLayout.AbsoluteContentSize.Y + 10)
                else
                    FolderFrame.Size = UDim2.new(1, 0, 0, 35)
                end
            end)

            ItemLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if isOpen then FolderFrame.Size = UDim2.new(1, 0, 0, 35 + ItemLayout.AbsoluteContentSize.Y + 10) end
            end)

            local FolderFuncs = {}

            -- Toggle di dalam Folder
            function FolderFuncs:AddToggle(ToggleText, Default, Callback)
                local State = Default or false
                local TglFrame = Instance.new("Frame", ItemContainer)
                TglFrame.Size = UDim2.new(1, -20, 0, 35)
                TglFrame.Position = UDim2.new(0, 10, 0, 0)
                TglFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                TglFrame.BackgroundTransparency = 0.5
                Instance.new("UICorner", TglFrame).CornerRadius = UDim.new(0, 5)

                local ToggleBtn = Instance.new("TextButton", TglFrame)
                ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
                ToggleBtn.BackgroundTransparency = 1
                ToggleBtn.Text = ToggleText .. "   |   " .. (State and "ON" or "OFF")
                ToggleBtn.TextColor3 = State and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(230, 230, 230)
                ToggleBtn.Font = Enum.Font.GothamSemibold
                ToggleBtn.TextSize = 13
                ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
                local Pad = Instance.new("UIPadding", ToggleBtn)
                Pad.PaddingLeft = UDim.new(0, 15)

                if Default then Callback(State) end
                ToggleBtn.MouseButton1Click:Connect(function()
                    State = not State
                    ToggleBtn.Text = ToggleText .. "   |   " .. (State and "ON" or "OFF")
                    ToggleBtn.TextColor3 = State and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(230, 230, 230)
                    Callback(State)
                end)
            end

            -- Label/Note di dalam Folder
            function FolderFuncs:AddLabel(TextContent)
                local LblFrame = Instance.new("Frame", ItemContainer)
                LblFrame.Size = UDim2.new(1, -20, 0, 0)
                LblFrame.AutomaticSize = Enum.AutomaticSize.Y
                LblFrame.Position = UDim2.new(0, 10, 0, 0)
                LblFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                LblFrame.BackgroundTransparency = 0.8
                Instance.new("UICorner", LblFrame).CornerRadius = UDim.new(0, 5)

                local LblText = Instance.new("TextLabel", LblFrame)
                LblText.Size = UDim2.new(1, 0, 0, 0)
                LblText.AutomaticSize = Enum.AutomaticSize.Y
                LblText.BackgroundTransparency = 1
                LblText.Text = TextContent
                LblText.TextColor3 = Color3.fromRGB(200, 200, 200)
                LblText.Font = Enum.Font.GothamSemibold
                LblText.TextSize = 11
                LblText.TextWrapped = true
                LblText.TextXAlignment = Enum.TextXAlignment.Left
                local LPad = Instance.new("UIPadding", LblText)
                LPad.PaddingLeft = UDim.new(0, 15); LPad.PaddingRight = UDim.new(0, 15)
                LPad.PaddingTop = UDim.new(0, 8); LPad.PaddingBottom = UDim.new(0, 8)
            end
            return FolderFuncs
        end

        return TabFunctions
    end
    WindowFunctions:Notify("NOXVA HUB", "Execute Success! Selamat datang.", 4)
    return WindowFunctions
end

return NoxvaLib
