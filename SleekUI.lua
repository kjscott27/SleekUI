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
-- Name printing test code

print('Hello ' .. UnitName('player'));
print('Class: ' .. UnitClass('player'));
print('Level: ' .. UnitLevel('player'));
---------------------
-- Actual Addon 


-- create & set parent frame
local ParentFrame = CreateFrame('Frame', 'SleekParentFrame', UIParent, 'BasicFrameTemplateWithInset');


-- set the size and where it will anchor on the screen
ParentFrame:SetSize(300, 360); -- width, height
ParentFrame:SetPoint('center');

-- set the text and text style for the title of the frame
ParentFrame.title = ParentFrame:CreateFontString(nil, 'overlay', 'GameFontHighlight');
ParentFrame.title:SetPoint('left', ParentFrame.TitleBg, 'left', 5, 0);
ParentFrame.title:SetText('SleekUI Buff Options');

-- create some buttons
---- * Save Button
ParentFrame.saveButton = CreateFrame('Button', nil, ParentFrame, 'GameMenuButtonTemplate');
ParentFrame.saveButton:SetPoint('center', ParentFrame, 'top', 0, -70);
ParentFrame.saveButton:SetSize(140, 40);
ParentFrame.saveButton:SetText('Save');
ParentFrame.saveButton:SetNormalFontObject('GameFontHighlight');
ParentFrame.saveButton:SetHighlightFontObject('GameFontHighlightLarge');

---- * Reset Button
ParentFrame.resetButton = CreateFrame('Button', nil, ParentFrame, 'GameMenuButtonTemplate')
ParentFrame.resetButton:SetPoint('top', ParentFrame.saveButton, 'bottom', 0, -10);
ParentFrame.resetButton:SetSize(140, 40);
ParentFrame.resetButton:SetText('Reset');
ParentFrame.resetButton:SetNormalFontObject('GameFontHighlight');
ParentFrame.resetButton:SetHighlightFontObject('GameFontHighlightLarge');

---- * Cancel Button
ParentFrame.loadButton = CreateFrame('Button', nil, ParentFrame, 'GameMenuButtonTemplate')
ParentFrame.loadButton:SetPoint('top', ParentFrame.resetButton, 'bottom', 0, -10);
ParentFrame.loadButton:SetSize(140, 40);
ParentFrame.loadButton:SetText('Cancel');
ParentFrame.loadButton:SetNormalFontObject('GameFontHighlight');
ParentFrame.loadButton:SetHighlightFontObject('GameFontHighlightLarge');

-- create some sliders
---- * Slider 1
ParentFrame.sliderOne = CreateFrame('Slider', nil, ParentFrame, 'OptionsSliderTemplate');
ParentFrame.sliderOne:SetPoint('top', ParentFrame.loadButton, 'bottom', 0, -20);
ParentFrame.sliderOne:SetMinMaxValues(1, 100);
ParentFrame.sliderOne:SetValue(50);
ParentFrame.sliderOne:SetValueStep(30);
ParentFrame.sliderOne:SetObeyStepOnDrag(true);

---- * Slider 2
ParentFrame.sliderTwo = CreateFrame('Slider', nil, ParentFrame, 'OptionsSliderTemplate');
ParentFrame.sliderTwo:SetPoint('top', ParentFrame.sliderOne, 'bottom', 0, -20);
ParentFrame.sliderTwo:SetMinMaxValues(1, 100);
ParentFrame.sliderTwo:SetValue(40);
ParentFrame.sliderTwo:SetValueStep(1);
ParentFrame.sliderTwo:SetObeyStepOnDrag(true);

-- create some checkboxes 
---- * Checkbox 1
ParentFrame.checkboxOne = CreateFrame('CheckButton', nil, ParentFrame, 'UICheckButtonTemplate');
ParentFrame.checkboxOne:SetPoint('topLeft', ParentFrame.sliderTwo, 'bottomLeft', -10, -40);
ParentFrame.checkboxOne.text:SetText('Some Check Button');

---- * Checkbox 2
ParentFrame.checkboxTwo = CreateFrame('CheckButton', nil, ParentFrame, 'UICheckButtonTemplate');
ParentFrame.checkboxTwo:SetPoint('topLeft', ParentFrame.checkboxOne, 'bottomLeft', 0, -10);
ParentFrame.checkboxTwo.text:SetText('Some Check Button');











