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
	1. point
	2. relativeFrame
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
-- Name Spaces

local _, core = ...;
core.Config = {};

local Config = core.Config;
local ParentFrame;

---------------------
-- Defaults (usually a DB)

local defaults = {
	theme = {
		r = 0,
		g = 0,8, -- divide hexNumber/255 (theme goes from 0 - 100 for color)
		b = 1,
		hex = '00ccff'
	}
}

---------------------
-- Actual Addon 

function Config:Toggle()
	local menu = ParentFrame or Config:CreateMenu();
	menu:SetShown(not menu:IsShown());
end

function Config:GetThemeColor()
	local something = {};
	return something;
end

function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text)
	local button = CreateFrame('Button', nil, ParentFrame, 'GameMenuButtonTemplate');
	button:SetPoint(point, relativeFrame, relativePoint, 0, yOffset);
	button:SetSize(140, 40);
	button:SetText(text);
	button:SetNormalFontObject('GameFontNormalLarge');
	button:SetHighlightFontObject('GameFontHighlightLarge');
	return button;
end

function Config:CreateSlider(relevantFrame, sliderValue, sliderStep)
	local slider = CreateFrame('Slider', nil, ParentFrame, 'OptionsSliderTemplate');
	slider:SetPoint('top', relevantFrame, 'bottom', 0, -20);
	slider:SetMinMaxValues(0, 100);
	slider:SetValue(sliderValue);
	slider:SetValueStep(sliderStep);
	slider:SetObeyStepOnDrag(true);
	return slider;
end

function Config:CreateCheckbox(relevantFrame, xOffset, yOffset, text)
	local CheckBox = CreateFrame('CheckButton', nil, ParentFrame, 'UICheckButtonTemplate');
	CheckBox:SetPoint('topLeft', relevantFrame, 'bottomLeft', xOffset, yOffset);
	CheckBox.text:SetText(text);
	return CheckBox;
end

function Config:CreateMenu() 
	-- create & set parent frame
	ParentFrame = CreateFrame('Frame', 'SleekParentFrame', UIParent, 'BasicFrameTemplateWithInset');


	-- set the size and where it will anchor on the screen
	ParentFrame:SetSize(260, 400); -- width, height
	ParentFrame:SetPoint('center');

	-- set the text and text style for the title of the frame
	ParentFrame.title = ParentFrame:CreateFontString(nil, 'overlay', 'GameFontHighlight');
	ParentFrame.title:SetPoint('left', ParentFrame.TitleBg, 'left', 5, 0);
	ParentFrame.title:SetText('SleekUI Buff Options');

	-- create some buttons
	---- * Save Button
	ParentFrame.saveButton = self:CreateButton('center', ParentFrame, 'top', -70, 'Save');

	---- * Reset Button
	ParentFrame.resetButton = self:CreateButton('top', ParentFrame.saveButton, 'bottom', -10, 'Reset');

	---- * Cancel Button
	ParentFrame.cancelButton = self:CreateButton('top', ParentFrame.resetButton, 'bottom', -10, 'Cancel');

	-- create some sliders
	---- * Slider 1
	ParentFrame.sliderOne = self:CreateSlider(ParentFrame.resetButton, 50, 30);

	---- * Slider 2
	ParentFrame.sliderTwo = self:CreateSlider(ParentFrame.sliderOne, 1, 1);

	-- create some checkboxes 
	---- * Checkbox 1
	ParentFrame.checkBoxOne = self:CreateCheckbox(ParentFrame.sliderTwo, -10, -40, 'Some Check Button');

	---- * Checkbox 2
	ParentFrame.checkBoxTwo = self:CreateCheckbox(ParentFrame.checkBoxOne, 0, -10, 'Some Check Button');

	ParentFrame.Hide();
	return ParentFrame;
end