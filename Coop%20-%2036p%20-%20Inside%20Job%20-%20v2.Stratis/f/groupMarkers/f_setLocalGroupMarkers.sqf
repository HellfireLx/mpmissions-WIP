// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction
if(count _this == 0) then
{
	_unitfaction = toLower (faction player);

	// If the unitfaction is different from the 	group leader's faction, the latters faction is used
	if (_unitfaction != toLower (faction (leader group player))) then {_unitfaction = toLower (faction (leader group player))};
}
else
{
	_unitfaction = (_this select 0);
};
// ====================================================================================
switch (_unitfaction) do
{
// ====================================================================================

// MARKERS: BLUFOR > NATO
// Markers seen by players in NATO slots.

	case "blu_f":
	{
		["GrpNATO_CO", 0, "HQ", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpNATO_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpNATO_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpNATO_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpNATO_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpNATO_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpNATO_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpNATO_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpNATO_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitNATO_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};

// ====================================================================================

// MARKERS: OPFOR > CSAT
// Markers seen by players in CSAT slots.

	case "opf_f":
	{
		["GrpCSAT_CO", 0, "HQ", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpCSAT_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpCSAT_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitCSAT_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};

// ====================================================================================

// MARKERS: INDEPEDENT > AAF
// Markers seen by players in AAF slots.

	case "ind_f":
	{
		["GrpAAF_CO", 0, "HQ", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpAAF_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpAAF_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpAAF_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpAAF_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpAAF_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpAAF_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpAAF_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpAAF_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitAAF_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};
	
// ====================================================================================

// MARKERS: BLUFOR > FIA
// Markers seen by players in BLUFOR-FIA slots.

	case "blu_g_f":
	{
		["GrpFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpFIA_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpFIA_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpFIA_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpFIA_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpFIA_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitFIA_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};

// ====================================================================================

// MARKERS: OPFOR > FIA
// Markers seen by players in OPFOR-FIA slots.

	case "opf_g_f":
	{
		["GrpOFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpOFIA_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpOFIA_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitOFIA_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};

// ====================================================================================

// MARKERS: INDEPENDENT > FIA
// Markers seen by players in INDEPENDENT-FIA slots.

	case "ind_g_f":
	{
		["GrpIFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MCC", 0, "GM", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_MMG1", 2, "MMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HMG1",  2, "HMG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MAT1", 3, "MAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HAT1",  3, "HAT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MTR1",  5, "MTR", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MSAM1",  3, "MSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HSAM1",  3, "HSAM", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_ST1",  4, "ST", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_DT1",  4, "DT", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_ENG1",  6, "ENG", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpIFIA_IFV1",  7, "Dgr1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV2",  7, "Dgr2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV3",  7, "Dgr3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV4",  7, "Dgr4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV5",  7, "Dgr5", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV6",  7, "Dgr6", "ColorOrange"] spawn f_fnc_localGroupMarker;

 		["GrpIFIA_TNK1",  8, "Th", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_TH1",  9, "Nb1", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH2",  9, "Nb2", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH3",  9, "Nb3", "ColorBlack"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH4",  9, "Nb4", "ColorBlack"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_AH1",  9, "Rpr", "ColorOrange"] spawn f_fnc_localGroupMarker;

		["UnitIFIA_CO_M", 0, "", "ColorYellow"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_ASL_M", 0, "", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_BSL_M", 0, "", "ColorBlue"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_CSL_M", 0, "", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
	};
};

// ====================================================================================


