-- External Script (MoonLib)
local Library = {}

-- Utility table
local Utility = {}

-- Utility:Create function to create instances dynamically
function Utility:Create(instanceType, properties, children)
    local newInstance = Instance.new(instanceType)

    for prop, value in pairs(properties) do
        if prop == "AnchorPoint" and typeof(value) == "UDim2" then
            newInstance[prop] = value.Position
        else
            newInstance[prop] = value
        end
    end

    if children then
        for _, child in pairs(children) do
            child.Parent = newInstance
        end
    end

    return newInstance
end

-- CreateWindow function in Library
function Library:CreateWindow(EmojiText)
    local Theme = {
        BackgroundColor = Color3.fromRGB(25, 25, 25),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
    }

    -- Create a ScreenGui
    local screenGui = Utility:Create('ScreenGui', {
        Name = 'MainScreenGui',
        DisplayOrder = 1,
        ResetOnSpawn = false
    })

    -- Create a Frame and add it to the ScreenGui
    local frame = Utility:Create('Frame', {
        Name = 'Main',
        BackgroundColor3 = Theme.BackgroundColor,
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 350, 0, 400),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 7),
            Name = 'MainCorner'
        }),
        Utility:Create('TextLabel', {
            Name = 'Emoji',
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 50, 0, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.FredokaOne,
            Text = EmojiText,
            TextColor3 = Theme.PrimaryTextColor,
            TextSize = 18,
            ZIndex = 2,
            TextXAlignment = Enum.TextXAlignment.Center
        })
    })

    -- Parent the screenGui to the player's PlayerGui
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    frame.Parent = screenGui
end

-- Return the Library table
return Library
