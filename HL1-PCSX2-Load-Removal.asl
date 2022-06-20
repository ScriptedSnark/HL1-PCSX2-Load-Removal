// PCSX2 v1.6.0 HL1 Load-Removal for WINDOWS 10
// Based on PCSX2 v1.4.0 HL1 Load-Removal by SmileyAG and ScriptedSnark
// This repository is focused to fine working Load-Removal on LiveSplit v1.8.18+ and optimized Version Detector (using ModuleSize instead of MD5Hash)
// 
// Be sure to disable BunnySplit in Edit Splits, otherwise the PCSX2 autosplitter won't work!
// SET YOUR "COMPARE AGAINST" TO (GAME TIME) BY RIGHT CLICKING ON YOUR SPLITS OR YOU WON'T SEE LOADS GETTING PAUSED !!
// WORKING ONLY ON EUROPE REGION

state("pcsx2", "v1.6.0") // Offsets
{
	int loading: "pcsx2.exe", 0x012BC95C, 0x2B8, 0xA4, 0x14;
	string10 map: "pcsx2.exe", 0x0123E650, 0x1C0;
}

init // Version specific
{
	var mms = modules.First().ModuleMemorySize;
    	// print("0x" + mms.ToString("X"));

	if(mms == 0x2D56000)
		version = "v1.6.0";
	else
		version = "UNDETECTED";
}

isLoading // Gametimer
{
	return current.loading == 1;
}

update // Version specific
{
	if (version.Contains("UNDETECTED"))
		return false;
}
