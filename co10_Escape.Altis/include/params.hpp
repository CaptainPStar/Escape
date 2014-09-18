class Params
{
	class Param_Loadparams
    {
            title = "Parameter Loading";
            values[] = {0, 1, 2};
            texts[] = {"Use below and save", "Load existing (Use below if not found)", "Use below without save"};
            default = 0;
	};
    class Param_EnemySkill
    {
            title = "Enemy Skill";
            values[] = {0, 1, 2, 3, 4, 6};
            texts[] = {"Cadet", "Easy", "Normal", "Hard", "Extreme", "Use this setting for AI mods such as Zeus AI"};
            default = 0;
	};
	class Param_EnemyFrequency
	{
		title="Enemy Frequency";
		values[]={1,2,3};
		texts[]={"Few (suitable for 1-3 players)", "Some (suitable for 4-6 players)", "A lot (suitable for 7-8 players)"};
		default = 1;
	};
	class Param_SPLives	
	{	
	    title="Singleplayer respawns";
		values[]={0,1,2,3,4};
		texts[]={"No respawn","1","2","3","4"};
		default = 2;
	};
	class Param_TimeOfDay	
	{	
	      	title="Time Of Day";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		texts[]={"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","Random"};
		default = 24;
	};
	class Param_TimeMultiplier	
	{	
	    title="Time Multiplier (Fasttime)";
		values[]={1,6,12,24,36};
		texts[]={"1:1 (Normal)","1:6 (Day = 4 Hours)","1:12 (Day = 2 Hours)","1:24 (Day = 1 Hour)","1:36 (Day = 40 Minutes)"};
		default = 24;
	};
	class Param_initWeather
	{
		title = "Initial weather";
		values[] = {0,1,2,3,4,5};
		texts[] = {"Clear","Sunny","Cloudy","Foggy","Stormy","Random"};
		default = 1;
	};
	class Param_WeatherTrend
	{
		title = "Weather Trend";
		values[] = {0,1,2,3,4,5,6};
		texts[] = {"Constant init level (random events return to this)","Worse","Likely to trend to worse","Better","Likely to trend to better","Randomly cycling","Random at any"};
		default = 6;
	};
	class Param_probRnd
	{
		title = "Random weather events";
		values[] = {0,1,2,3};
		texts[] = {"Never","Rarely","Sometimes","Often"};
		default = 2;
	};
	class Param_Grass
	{	
		title="Grass";
		values[]={50,25,12,6,2};
		texts[]={"No Grass", "Proximity", "Normal", "Far", "Very Far"};
		default = 12;
	};
	class Param_EnemySpawnDistance
	{
		title="Enemy Spawn Distance";
		values[]={800,1050,1300};
		texts[]={"Short (better performance)", "Medium", "Far (for good rigs)"};
		default = 1050;
	};
	class Param_VillageSpawnCount
	{
		title="Village Patrol Spawns";
		values[]={80000, 40000, 10000};
		texts[]={"Low (better performance)", "Medium", "High (Very demanding)"};
		default = 40000;
	};
	class Param_BuildingGradient
	{
		title="Building Gradient";
		values[]={0, 1, 2, 3, 4};
		texts[]={"Very Flat", "Slight Incline (Default)", "Fair Incline", "Steep Incline", "Very Steep Incline"};
		default = 1;
	};
	class Param_ExtractionSelection
	{
		title="Extraction Points";
		values[]={0, 1, 2};
		texts[]={"Random", "Close", "Far"};
		default = 2;
	};	
	class Param_RespawnButton
	{
		title="Reenable respawn button";
		values[]={0,1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class Param_NoNightvision
	{
		title="NVG-Goggles and TWS Scopes";
		values[]={0,1};
		texts[]={"All", "No Goggles and TWS"};
		default = 1;
	};
	class Param_strikeWarning
	{
		title="Artillery warning";
		values[]={0,1};
		texts[]={"Off", "On"};
		default = 1;
	};
	class Param_weakChoppers
	{
		title="Extraction choppers are more vulnerable";
		values[]={0,1};
		texts[]={"Off", "On"};
		default = 1;
	};
		class Param_Kart
	{
		title="Karts";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 1;
	};
		class param_pureFactions
	{
		title="Pure or mixed addon factions";
		values[]={0, 1};
		texts[]={"Mixed", "Pure"};
		default = 0;
	};
	class param_manAuto
	{
		title="Automatic or manual addon selection";
		values[]={0, 1};
		texts[]={"Manual - choose below", "Automatic - settings below are ignored"};
		default = 1;
	};
	class param_RDScivs
	{
		title="RDS Civilian pack";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class param_mechs
	{
		title="WAP mechs addon";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class param_CAF
	{
		title="CAF addons";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class param_EvW
	{
		title="East vs West addon";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class param_HLC
	{
		title="HLC weapons pack";
		values[]={0, 1};
		texts[]={"Off", "On"};
		default = 0;
	};

	
};