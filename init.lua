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

---------------------
-- Namespaces

local _, core = ...;

---------------------