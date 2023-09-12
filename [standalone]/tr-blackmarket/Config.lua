Config = {}

Config.UseBlip = false                     -- [true to enable the blip | false disables the blip]

Config.Location = {
    Coords = vector4(-279.14, 2206.02, 129.85 - 1.00, 67.35),
    ModelName = "a_m_y_epsilon_02",
    ModelHash = 0xAA82FF9B,
    SetBlipSprite = 303,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 40,
    BlipName = "BlackMarket Dealer"
}

Config.Icons = {
    EyeIcon = "fa-solid fa-face-smile-horns",
    Header = "fa-solid fa-person-rifle",
    Pistol = "fa-solid fa-gun",
    SubMachineGuns = "fa-solid fa-gun",
    Shotguns = "fa-solid fa-gun",
    AssaultWeapons = "fa-solid fa-gun",
    Miscellanceous = "fa-solid fa-icons"
}

Config.Text = {
    TargetLabel = "BlackMarket Seller",
    PedHeader = "BlackMarket Dealer",
    Miscellanceous = "Miscellanceous",

}

Config.MiscellanceousShop = {
    label = "Black Market Miscellanceous Shop",
    slots = 10,
    items = {
        [1] = {
            name = "trojan_usb",
            price = 1000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "thermite",
            price = 500,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "drill",
            price = 1000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "advancedlockpick",
            price = 600,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "gatecrack",
            price = 3000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "security_card_01",
            price = 1000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "security_card_02",
            price = 1000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "electronickit",
            price = 1000,
            amount = 1,
            info = { quality = 100, },
            type = "item",
            slot = 8,
        },

    }
}
