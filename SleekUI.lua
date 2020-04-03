-- Debugging Tools

SLASH_RELOADUI1 = '/rl' -- for quick relading of the UI
SlashCmdList.RELOADUI = ReloadUI;

SLASH_FRAMESTK1 = '/fs' -- for quick access to the frame stack
SlashCmdList.FRAMESTK = function()
	LoadAddOn('Blizzard_DebugTools');
	FrameStackTooltip_Toggle();
end

for i = 1, NUM_CHAT_WINDOWS do
	_G['ChatFrame'..i..'EditBox']:SetAltArrowKeyMode(false);
end


--[[ 
	CreateFrame args:
	1. Type of Frame
	2. Global frame name (self named)
	3. The parent frame (this is not a string)
	4. A comma separated list of XML templates to inherit (this is a string list):
		* 'BasicFrameTemplateWithInset' OR 'BasicFrameTemplateWithInset, SomeOtherTemplate'
--]]

--[[
	SetPoint args:
	1. anchorPoint
	2. parentFrame
	3. relativePoint
	4. xOffset
	5. yOffset
--]]

--[[
	Anchor/Relative point assignments
	1. topLeft
	2. top
	3. topRight
	4. right
	5. left
	6. center
	7. bottomLeft
	8. bottom
	9. bottomRight
--]]

---------------------
-- Actual Addon 

print('Hello ' .. UnitName('player') .. ' Level:  ' .. UnitLevel('player'));

local ParentFrame = CreateFrame('Frame', 'SleekParentFrame', UIParent, 'BasicFrameTemplateWithInset');

ParentFrame:SetSize(300, 360); -- width, height
ParentFrame:SetPoint('center', UIParent, 'center');





