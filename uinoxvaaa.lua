local NoxvaLib = {}

-- ==========================================
-- FUNGSI UTAMA BIKIN WINDOW
-- ==========================================
function NoxvaLib:CreateWindow()
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local StatsService = game:GetService("Stats")

    -- AUTO CLEAN
    if gethui then
        if gethui():FindFirstChild("NoxvaHub_Pure") then gethui().NoxvaHub_Pure:Destroy() end
    else
        if CoreGui:FindFirstChild("NoxvaHub_Pure") then CoreGui.NoxvaHub_Pure:Destroy() end
    end

    local NoxvaUI = Instance.new("ScreenGui")
    NoxvaUI.Name = "NoxvaHub_Pure"
    NoxvaUI.ResetOnSpawn = false 
    if gethui then NoxvaUI.Parent = gethui() else pcall(function() NoxvaUI.Parent = CoreGui end) end

    -- LOGO MINIMIZE
    local OpenLogo = Instance.new("Frame")
    OpenLogo.Size = UDim2.new(0, 50, 0, 50)
    OpenLogo.Position = UDim2.new(0.5, -25, 0, 20)
    OpenLogo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    OpenLogo.Visible = false 
    OpenLogo.Parent = NoxvaUI
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

    -- MAIN FRAME & TOPBAR
    local MainFrame = Instance.new("Frame", NoxvaUI)
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)
    
    local TopBarBlocker = Instance.new("Frame", TopBar)
    TopBarBlocker.Size = UDim2.new(1, 0, 0, 10)
    TopBarBlocker.Position = UDim2.new(0, 0, 1, -10)
    TopBarBlocker.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.Size = UDim2.new(0, 200, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "NOXVA HUB | By Danzyy"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local TopBarStats = Instance.new("TextLabel", TopBar)
    TopBarStats.Size = UDim2.new(0, 150, 1, 0)
    TopBarStats.Position = UDim2.new(0.5, -75, 0, 0)
    TopBarStats.BackgroundTransparency = 1
    TopBarStats.TextColor3 = Color3.fromRGB(0, 255, 150)
    TopBarStats.Font = Enum.Font.GothamMedium
    TopBarStats.TextSize = 13

    -- FPS & PING LOGIC
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

    -- BUTTONS MINIMIZE & CLOSE
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

    -- DRAGGABLE
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

    -- SIDEBAR & CONTENT AREA
    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 130, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    
    local SidebarLayout = Instance.new("UIListLayout", Sidebar)
    SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SidebarLayout.Padding = UDim.new(0, 5)

    local ContentArea = Instance.new("Frame", MainFrame)
    ContentArea.Size = UDim2.new(1, -130, 1, -40)
    ContentArea.Position = UDim2.new(0, 130, 0, 40)
    ContentArea.BackgroundTransparency = 1

    local WindowFunctions = {}
    local FirstTab = true

    -- ==========================================
    -- FUNGSI BIKIN TAB (MENU)
    -- ==========================================
    function WindowFunctions:MakeTab(TabName)
        local TabBtn = Instance.new("TextButton", Sidebar)
        TabBtn.Size = UDim2.new(1, 0, 0, 35)
        TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabBtn.Text = TabName
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.TextSize = 14

        local TabPage = Instance.new("ScrollingFrame", ContentArea)
        TabPage.Size = UDim2.new(1, -20, 1, -20)
        TabPage.Position = UDim2.new(0, 10, 0, 10)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 2
        TabPage.Visible = FirstTab

        if FirstTab then TabBtn.TextColor3 = Color3.fromRGB(0, 120, 255); FirstTab = false end

        local PageLayout = Instance.new("UIListLayout", TabPage)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 5)

        TabBtn.MouseButton1Click:Connect(function()
            for _, child in pairs(ContentArea:GetChildren()) do if child:IsA("ScrollingFrame") then child.Visible = false end end
            for _, child in pairs(Sidebar:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(200, 200, 200) end end
            TabPage.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(0, 120, 255)
        end)

        local TabFunctions = {}

        -- ==========================================
        -- FUNGSI BIKIN TOMBOL DI DALAM TAB
        -- ==========================================
        function TabFunctions:AddButton(BtnText, Callback)
            local Btn = Instance.new("TextButton", TabPage)
            Btn.Size = UDim2.new(1, 0, 0, 35)
            Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Btn.Text = BtnText
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.Font = Enum.Font.GothamBold
            Btn.TextSize = 14
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 5)

            Btn.MouseButton1Click:Connect(function()
                Callback()
            end)
        end

        return TabFunctions
    end

    return WindowFunctions
end

return NoxvaLib
