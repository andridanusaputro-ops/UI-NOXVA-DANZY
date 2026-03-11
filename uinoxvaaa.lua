-- ==========================================
-- NOXVA UI ENGINE | PREMIUM GLASS & AESTHETIC
-- ==========================================
local NoxvaLib = {}

function NoxvaLib:CreateWindow()
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local StatsService = game:GetService("Stats")
    local TweenService = game:GetService("TweenService") -- Tambahan buat animasi Notif

    if gethui then
        if gethui():FindFirstChild("NoxvaHub_Pure") then gethui().NoxvaHub_Pure:Destroy() end
    else
        if CoreGui:FindFirstChild("NoxvaHub_Pure") then CoreGui.NoxvaHub_Pure:Destroy() end
    end

    local NoxvaUI = Instance.new("ScreenGui")
    NoxvaUI.Name = "NoxvaHub_Pure"
    NoxvaUI.ResetOnSpawn = false 
    if gethui then NoxvaUI.Parent = gethui() else pcall(function() NoxvaUI.Parent = CoreGui end) end

    -- Container buat Notifikasi di pojok kanan bawah
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
    
    local LogoText = Instance.new("TextLabel", OpenLogo)
    LogoText.Size = UDim2.new(1, 0, 1, 0)
    LogoText.BackgroundTransparency = 1
    LogoText.Text = "NX"
    LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
    LogoText.Font = Enum.Font.GothamBold
    LogoText.TextSize = 22
    
    local LogoClicker = Instance.new("TextButton", OpenLogo)
    LogoClicker.Size = UDim2.new(1, 0, 1, 0)
    LogoClicker.BackgroundTransparency = 1
    LogoClicker.Text = ""

    local FloatingStats = Instance.new("TextLabel", OpenLogo)
    FloatingStats.Size = UDim2.new(0, 150, 0, 20)
    FloatingStats.Position = UDim2.new(0.5, -75, 0, -25)
    FloatingStats.BackgroundTransparency = 1
    FloatingStats.TextColor3 = Color3.fromRGB(0, 255, 150)
    FloatingStats.Font = Enum.Font.GothamBold
    FloatingStats.TextSize = 12
    FloatingStats.TextStrokeTransparency = 0.5

    -- MAIN FRAME (Transparan Dikit)
    local MainFrame = Instance.new("Frame", NoxvaUI)
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.15 -- EFEK GLASS
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

    -- =======================================
    -- FITUR NOTIFIKASI
    -- =======================================
    function WindowFunctions:Notify(Title, Text, Duration)
        local NotifFrame = Instance.new("Frame", NotifContainer)
        NotifFrame.Size = UDim2.new(1, 0, 0, 60)
        NotifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        NotifFrame.BackgroundTransparency = 0.1
        NotifFrame.Position = UDim2.new(1, 300, 0, 0) -- Mulai dari luar layar
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

        -- Animasi masuk
        TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()

        -- Animasi keluar & hapus
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
        TabPage.ScrollBarThickness = 0 -- Ilangin scrollbar biar estetik
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

        function TabFunctions:AddSection(TitleText)
            local Section = Instance.new("TextLabel", TabPage)
            Section.Size = UDim2.new(1, 0, 0, 25)
            Section.BackgroundTransparency = 1
            Section.Text = TitleText
            Section.TextColor3 = Color3.fromRGB(0, 120, 255)
            Section.Font = Enum.Font.GothamBold
            Section.TextSize = 12
            Section.TextXAlignment = Enum.TextXAlignment.Left
            
            local SecPad = Instance.new("UIPadding", Section)
            SecPad.PaddingLeft = UDim.new(0, 5)
        end

        function TabFunctions:AddButton(BtnText, Callback)
            local BtnFrame = Instance.new("Frame", TabPage)
            BtnFrame.Size = UDim2.new(1, 0, 0, 35)
            BtnFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            BtnFrame.BackgroundTransparency = 0.2
            Instance.new("UICorner", BtnFrame).CornerRadius = UDim.new(0, 5)

            local Btn = Instance.new("TextButton", BtnFrame)
            Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.BackgroundTransparency = 1
            Btn.Text = BtnText
            Btn.TextColor3 = Color3.fromRGB(230, 230, 230)
            Btn.Font = Enum.Font.GothamSemibold
            Btn.TextSize = 13
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            
            local Pad = Instance.new("UIPadding", Btn)
            Pad.PaddingLeft = UDim.new(0, 15)

            Btn.MouseButton1Click:Connect(function() Callback() end)
        end

        function TabFunctions:AddToggle(ToggleText, Default, Callback)
            local State = Default or false
            local TglFrame = Instance.new("Frame", TabPage)
            TglFrame.Size = UDim2.new(1, 0, 0, 35)
            TglFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TglFrame.BackgroundTransparency = 0.2
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

        function TabFunctions:AddSlider(SliderText, Min, Max, Default, Callback)
            local Value = Default or Min
            local SliderContainer = Instance.new("Frame", TabPage)
            SliderContainer.Size = UDim2.new(1, 0, 0, 50)
            SliderContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SliderContainer.BackgroundTransparency = 0.2
            Instance.new("UICorner", SliderContainer).CornerRadius = UDim.new(0, 5)

            local Label = Instance.new("TextLabel", SliderContainer)
            Label.Size = UDim2.new(1, -30, 0, 20)
            Label.Position = UDim2.new(0, 15, 0, 5)
            Label.BackgroundTransparency = 1
            Label.Text = SliderText .. " : " .. tostring(Value)
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Font = Enum.Font.GothamSemibold
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local SliderBack = Instance.new("TextButton", SliderContainer)
            SliderBack.Size = UDim2.new(1, -30, 0, 6)
            SliderBack.Position = UDim2.new(0, 15, 0, 32)
            SliderBack.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            SliderBack.Text = ""
            Instance.new("UICorner", SliderBack).CornerRadius = UDim.new(1, 0)

            local SliderFill = Instance.new("Frame", SliderBack)
            SliderFill.Size = UDim2.new((Value - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
            Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

            local dragging = false
            local function updateSlider(input)
                local pos = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
                Value = math.floor(Min + (Max - Min) * pos)
                SliderFill.Size = UDim2.new(pos, 0, 1, 0)
                Label.Text = SliderText .. " : " .. tostring(Value)
                Callback(Value)
            end

            SliderBack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true; updateSlider(input)
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            Callback(Value)
        end

        function TabFunctions:AddDropdown(DropText, Options, Callback)
            local DropdownFrame = Instance.new("Frame", TabPage)
            DropdownFrame.Size = UDim2.new(1, 0, 0, 35)
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            DropdownFrame.BackgroundTransparency = 0.2
            DropdownFrame.ClipsDescendants = true
            Instance.new("UICorner", DropdownFrame).CornerRadius = UDim.new(0, 5)

            local DropButton = Instance.new("TextButton", DropdownFrame)
            DropButton.Size = UDim2.new(1, 0, 0, 35)
            DropButton.BackgroundTransparency = 1
            DropButton.Text = DropText .. " :  " .. tostring(Options[1] or "")
            DropButton.TextColor3 = Color3.fromRGB(230, 230, 230)
            DropButton.Font = Enum.Font.GothamSemibold
            DropButton.TextSize = 13
            DropButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local Pad = Instance.new("UIPadding", DropButton)
            Pad.PaddingLeft = UDim.new(0, 15)

            local DropContainer = Instance.new("ScrollingFrame", DropdownFrame)
            DropContainer.Size = UDim2.new(1, 0, 1, -35)
            DropContainer.Position = UDim2.new(0, 0, 0, 35)
            DropContainer.BackgroundTransparency = 1
            DropContainer.ScrollBarThickness = 0
            
            local DropLayout = Instance.new("UIListLayout", DropContainer)
            DropLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local isOpen = false
            DropButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    local frameHeight = 35 + (#Options * 30)
                    if frameHeight > 150 then frameHeight = 150 end
                    DropdownFrame.Size = UDim2.new(1, 0, 0, frameHeight)
                    DropContainer.CanvasSize = UDim2.new(0, 0, 0, #Options * 30)
                else
                    DropdownFrame.Size = UDim2.new(1, 0, 0, 35)
                end
            end)

            for _, option in ipairs(Options) do
                local OptBtn = Instance.new("TextButton", DropContainer)
                OptBtn.Size = UDim2.new(1, 0, 0, 30)
                OptBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                OptBtn.BackgroundTransparency = 0.5
                OptBtn.Text = tostring(option)
                OptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                OptBtn.Font = Enum.Font.Gotham
                OptBtn.TextSize = 13
                OptBtn.BorderSizePixel = 0
                OptBtn.TextXAlignment = Enum.TextXAlignment.Left
                
                local OptPad = Instance.new("UIPadding", OptBtn)
                OptPad.PaddingLeft = UDim.new(0, 25)
                
                OptBtn.MouseButton1Click:Connect(function()
                    DropButton.Text = DropText .. " :  " .. tostring(option)
                    isOpen = false
                    DropdownFrame.Size = UDim2.new(1, 0, 0, 35)
                    Callback(option)
                end)
            end
            if Options[1] then Callback(Options[1]) end
        end

        function TabFunctions:AddTextbox(BoxText, Placeholder, Callback)
            local BoxFrame = Instance.new("Frame", TabPage)
            BoxFrame.Size = UDim2.new(1, 0, 0, 40)
            BoxFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            BoxFrame.BackgroundTransparency = 0.2
            Instance.new("UICorner", BoxFrame).CornerRadius = UDim.new(0, 5)

            local BoxLabel = Instance.new("TextLabel", BoxFrame)
            BoxLabel.Size = UDim2.new(0.4, 0, 1, 0)
            BoxLabel.Position = UDim2.new(0, 15, 0, 0)
            BoxLabel.BackgroundTransparency = 1
            BoxLabel.Text = BoxText
            BoxLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            BoxLabel.Font = Enum.Font.GothamSemibold
            BoxLabel.TextSize = 13
            BoxLabel.TextXAlignment = Enum.TextXAlignment.Left

            local TextBox = Instance.new("TextBox", BoxFrame)
            TextBox.Size = UDim2.new(0.55, -20, 0, 28)
            TextBox.Position = UDim2.new(0.45, 5, 0, 6)
            TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TextBox.PlaceholderText = Placeholder
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.Font = Enum.Font.Gotham
            TextBox.TextSize = 12
            Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 5)

            TextBox.FocusLost:Connect(function() Callback(TextBox.Text) end)
        end

        return TabFunctions
    end

    return WindowFunctions
end

return NoxvaLib
