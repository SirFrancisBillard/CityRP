
local PLAYER = FindMetaTable("Player")

function PLAYER:GetMentalState()
	return self:GetNWInt("mental_state", 100)
end

local MentalStates = {
	{
		Min = 0,
		Max = 10,
		Name = "FUCKED",
		Color = Color(255, 0, 0)
	},
	{
		Min = 11,
		Max = 20,
		Name = "Exceedingly Dangerous",
		Color = Color(255, 60, 0)
	},
	{
		Min = 21,
		Max = 30,
		Name = "Dangerous",
		Color = Color(255, 130, 0)
	},
	{
		Min = 31,
		Max = 40,
		Name = "Insane",
		Color = Color(255, 160, 0)
	},
	{
		Min = 41,
		Max = 50,
		Name = "Unstable",
		Color = Color(220, 190, 0)
	},
	{
		Min = 51,
		Max = 60,
		Name = "Worrying",
		Color = Color(190, 220, 0)
	},
	{
		Min = 61,
		Max = 70,
		Name = "Subpar",
		Color = Color(160, 255, 0)
	},
	{
		Min = 71,
		Max = 80,
		Name = "Mediocre",
		Color = Color(130, 255, 0)
	},
	{
		Min = 81,
		Max = 90,
		Name = "Decent",
		Color = Color(60, 255, 0)
	},
	{
		Min = 91,
		Max = 100,
		Name = "Healthy",
		Color = Color(0, 255, 0)
	}
}

function PLAYER:GetMentalStateTable()
	for k, v in pairs(MentalStates) do
		if self:GetMentalState() >= v.Min and self:GetMentalState() <= v.Max then
			return v
		end
	end

	return MentalStates[#MentalStates]
end

function PLAYER:UpdateMentalState()
	self:ChatPrint("Mental state: " .. self:GetMentalStateTable().Name)
end
