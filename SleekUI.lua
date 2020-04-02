-- Debugging Tools
SLASH_RELOAD = '/rl' -- for quick relading of the UI

SLASH_FRAMESTK = '/fs' -- for quick access to the frame stack

SlashCmdList.FRAMESTK = function()
	LoadAddOn('Blizzard_DebugTools');
	FrameStackTooltip_Toggle();
end

for i = 1, NUM_CHAT_WINDOWS do
	_G['ChatFrame"..i.."EditBox']:SetAltArrowKeyMode(false);
end

---------------------
-- Actual Addon 

print('Hello' .. UnitName('player') .. '' .. UnitLevel('player'));