addonName = "AngryGamerSimulatorTooltip"

genderOne = "Unknown (probably Male)"
genderTwo = "Male"
genderThreePlayer = "Female (probably Male IRL)"
genderThreeNpc = "Female"

local LOCALE = GetLocale()
if (LOCALE == "frFR") then
 genderOne = "Inconnu (probablement Homme)"
 genderTwo = "Homme"
 genderThreePlayer = "Femme (probablement Homme IRL)"
 genderThreeNpc = "Femme"
end

local function OnTooltipSetUnit(self)
 local gender
 local name, unit = self:GetUnit()
 if(not name or not unit) then 
  return 
 end
 
 gender = UnitSex(unit)
 if (gender == 1) then
  self:AddLine(genderOne, 0, 100, 200)
 elseif (gender == 2) then
  self:AddLine(genderTwo, 0, 100, 200)
 elseif (UnitIsPlayer(unit) == true and gender == 3) then
  self:AddLine(genderThreePlayer, 255, 0, 0)
 elseif (UnitIsPlayer(unit) == false and gender == 3) then
  self:AddLine(genderThreeNpc, 255, 0, 127)
 end
  self:Show()
 end

GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

local function OnPlayerLogin(self, event, ...)
 print(addonName.." "..GetAddOnMetadata(addonName, "Version").." loaded.")
end

local frame = CreateFrame("FRAME")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", OnPlayerLogin)
