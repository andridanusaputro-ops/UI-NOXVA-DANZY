-- ==========================================
-- NOXVA HUB | FISCH SCRIPT (SAFE MODE)
-- ==========================================

-- 1. SECURITY (ANTI-AFK & ANTI-ADMIN SAJA)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local function CheckAdmin(player)
    local staffNames = {"WoozyNeo", "FischAdmin", "Developer"}
    for _, name in ipairs(staffNames) do
        if string.find(string.lower(player.Name), string.lower(name)) then
            LocalPlayer:Kick("NOXVA SECURITY: Admin/Staff terdeteksi masuk! (" .. player.Name .. ")")
        end
    end
end
Players.PlayerAdded:Connect(CheckAdmin)
for _, player in ipairs(Players:GetPlayers()) do 
    if player ~= LocalPlayer then CheckAdmin(player) end 
end

-- 2. PANGGIL MESIN UI DARI GITHUB LU
local linkUI = "https://raw.githubusercontent.com/andridanusaputro-ops/UI-NOXVA-DANZY/main/uinoxvaaa.lua?t=" .. tostring(tick())
local NoxvaUI = loadstring(game:HttpGet(linkUI))()
local Window = NoxvaUI:CreateWindow()

-- 3. BIKIN TABS
local FishingTab = Window:MakeTab("🎣 Fishing")
local UtilTab = Window:MakeTab("⚙️ Utilities")
local TPTab = Window:MakeTab("🗺️ Teleports")
local ConfigTab = Window:MakeTab("📁 Configs")

-- [TAB: FISHING]
local ReelInfo = FishingTab:AddLabel("Current Reel Information\nName: nil\nMutation: None\nWeight: nil\nIsShiny: No")
local AutoFolder = FishingTab:AddFolder("Automation")
AutoFolder:AddLabel("NOTE:\nuse Lite Shake Mode if you having red cpu/insane lag while using the normal Auto Shake mode.")
AutoFolder:AddToggle("Start Auto Cast & Fishing", false, function(State) _G.AutoMancing = State end)
AutoFolder:AddToggle("Auto Shake", false, function(State) _G.AutoShake = State end)
AutoFolder:AddToggle("Auto Reel", false, function(State) _G.AutoReel = State end)
AutoFolder:AddToggle("Freeze Position", false, function(State) _G.FreezePos = State end)
AutoFolder:AddToggle("Lite Shake Mode", false, function(State) _G.LiteShake = State end)

local ModFolder = FishingTab:AddFolder("Modification")
ModFolder:AddToggle("Instant Bobber", false, function(State) _G.InstaBobber = State end)
ModFolder:AddToggle("Center Shake", false, function(State) _G.CenterShake = State end)
ModFolder:AddToggle("Always Progressing", false, function(State) _G.AlwaysProg = State end)
ModFolder:AddToggle("Anti Progress Loss", false, function(State) _G.AntiLoss = State end)

-- [TAB: UTILITIES]
local BoatFolder = UtilTab:AddFolder("Boat")
BoatFolder:AddSlider("Super Boat Speed", 0, 100, 0, function(Value) _G.BoatSpeed = Value end)
BoatFolder:AddToggle("Super Boat", false, function(State) _G.SuperBoat = State end)

local SellFolder = UtilTab:AddFolder("Selling")
SellFolder:AddToggle("Sell All On Fish Caught", false, function(State) _G.AutoSellCatch = State end)
SellFolder:AddSlider("Auto Sell All Delay (Minutes)", 0, 60, 0, function(Value) _G.SellDelay = Value end)
SellFolder:AddToggle("Auto Sell All", false, function(State) _G.AutoSellAll = State end)

local StarFolder = UtilTab:AddFolder("Starfall")
StarFolder:AddLabel("Is StarCrater Exist:\nYes") 
StarFolder:AddToggle("Auto Collect Star Crater", false, function(State) _G.AutoCrater = State end)

local RodsFolder = UtilTab:AddFolder("Rods")
RodsFolder:AddLabel("NOTE:\nsome rods likely cannot be purchased.")
RodsFolder:AddLabel("Price:\nC$ 0")
RodsFolder:AddDropdown("Select Rod", {"Lucky Rod", "Kings Rod", "Flimsy Rod"}, function(Rod) _G.SelectedRod = Rod end)
RodsFolder:AddButton("Try Purchase Selected Rod", function() print("Beli", _G.SelectedRod) end)

local CrateFolder = UtilTab:AddFolder("Crates")
CrateFolder:AddLabel("Price:\nC$ 0")
CrateFolder:AddDropdown("Select Crate", {"Bait Crate", "Carbon Crate"}, function(Crate) _G.SelectedCrate = Crate end)
CrateFolder:AddTextbox("Buy Crate Amount", "50", function(Amount) _G.CrateAmount = Amount end)
CrateFolder:AddButton("Try Purchase Selected Crate", function() print("Beli Crate") end)

local TotemFolder = UtilTab:AddFolder("Totems")
TotemFolder:AddLabel("Price:\nC$ 0")
TotemFolder:AddDropdown("Select Totem", {"Sundial Totem", "Eclipse Totem"}, function(Totem) _G.SelectedTotem = Totem end)
TotemFolder:AddTextbox("Buy Totem Amount", "50", function(Amount) _G.TotemAmount = Amount end)
TotemFolder:AddButton("Try Purchase Selected Totem", function() print("Beli Totem") end)

local DailyFolder = UtilTab:AddFolder("Daily Shop")
DailyFolder:AddDropdown("Select Items", {"Sundial Totem", "Bait Crate"}, function(Item) _G.DailyItem = Item end)
DailyFolder:AddToggle("Refresh With Credits", false, function(State) _G.RefreshCred = State end)
DailyFolder:AddToggle("Start Auto Daily Shopping", false, function(State) _G.AutoDaily = State end)
DailyFolder:AddButton("Open Daily Shop", function() print("Buka Daily Shop") end)

local MiscFolder = UtilTab:AddFolder("Miscellaneous")
MiscFolder:AddToggle("Show Radar", false, function(State) _G.Radar = State end)

-- [TAB: TELEPORTS]
local LocFolder = TPTab:AddFolder("Locations")
LocFolder:AddDropdown("Select Island", {"Moosewood", "Roslit Bay", "Snowcap Island"}, function(Pulau) _G.TPIsland = Pulau end)
LocFolder:AddButton("Teleport to Island", function() Window:Notify("Teleport", "OTW ke " .. tostring(_G.TPIsland), 3) end)
local NPCFolder = TPTab:AddFolder("NPCs")
NPCFolder:AddDropdown("Select NPC", {"Merchant", "Shipwright", "Bait Dealer"}, function(NPC) _G.TPNPC = NPC end)
NPCFolder:AddButton("Teleport to NPC", function() Window:Notify("Teleport", "OTW ke NPC " .. tostring(_G.TPNPC), 3) end)

-- [TAB: CONFIGS]
ConfigTab:AddLabel("Configuration\nSave and load your settings. Select a config from the dropdown or create a new one.")

ConfigTab:AddDropdown("Select Config", {"None", "MainConfig", "LegitFarm"}, function(Cfg)
    _G.SelectedConfig = Cfg
end)

ConfigTab:AddTextbox("New Config Name", "Enter name...", function(Name)
    _G.NewConfigName = Name
end)

ConfigTab:AddTextbox("Toggle Keybind", "RightControl", function(Key)
    _G.ToggleUIKey = Key
end)

ConfigTab:AddDoubleButton(
    "Save New", function() Window:Notify("Config", "Menyimpan " .. tostring(_G.NewConfigName), 3) end,
    "Load", function() Window:Notify("Config", "Memuat " .. tostring(_G.SelectedConfig), 3) end
)

ConfigTab:AddDoubleButton(
    "Overwrite", function() Window:Notify("Config", "Menimpa " .. tostring(_G.SelectedConfig), 3) end,
    "Delete", function() Window:Notify("Config", "Menghapus " .. tostring(_G.SelectedConfig), 3) end
)

ConfigTab:AddLabel("Auto Load\nEnable auto load.")
ConfigTab:AddToggle("Enable Auto Load", false, function(State)
    _G.AutoLoadEnabled = State
end)
ConfigTab:AddDropdown("Select Auto Load Config", {"None", "MainConfig", "LegitFarm"}, function(Cfg)
    _G.AutoLoadConfig = Cfg
end)

print("[NOXVA HUB] Menu berhasil dimuat!")
