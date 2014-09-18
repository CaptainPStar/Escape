/*
script: tort_DynamicWeather.sqf
Version: 1.2.4
Author: tortuosit
Date: 20140908

Disclaimer: Feel free to use and modify this code. Please report errors and enhancements back so that anybody can profit.

*** Thread and documentation: http://forums.bistudio.com/showthread.php?178674 ***

How to use:
1 - Save this script into your mission directory as tort_DynamicWeather.sqf
2 - Call it with 0 = ["cloudy", "freeCycle", [0.1, 0], [0.1, 0.3], [0, 0.8, 0, 0.6, 0, 1], 0, 0, 5] execVM "\@tort_DynamicWeather\script\tort_DynamicWeather.sqf";
    Arguments and presets see http://forums.bistudio.com/showthread.php?178674.

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS */

if (!isServer) exitWith {};
tort_dynamicweather = true; rptlogCounter = 1; tRandomCounter = 0; tort_infoboard_permanent = 0;
private ["_ocMin", "_ocMax", "_fogMin", "_fogMax", "_randOc", "_randFog", "_randWS", "_randWD", "_windMin", "_windMax", "_minVari", "_maxVari", "_ignoreMinMax", "_randomEvent", "_fogMinHeight", "_fogMaxHeight", "_daytime", "_groundfogBetween", "_goundFogActive", "_slices"];

// You can change the following values /////////////////////////////////////////
if isNil "tort_groundfog" then {tort_groundfog = 1};
_groundfogBetween = [20, 8]; // groundfog between hours of day
_fogMinHeight = 10; _fogMaxHeight = 80;
// Do not change anything below this line //////////////////////////////////////

// Random number generator
// Input: number, seed (integer)
// _myrandomnumber = [max] call tRandom;
tRandom = {
   tRandomCounter = tRandomCounter + 1;
   private["_i","_num","_out","_arr"]; _out = "";
   for "_i" from 1 to 6 do {
      _num = sin(_i^3 + tRandomCounter + seedVar) + 1;
      _arr = toArray str(_num);
      if ((count _arr) > 6) then {_out = _out + toString([_arr select ((count _arr) - 2)]);};
   };
   seedvar = (1000000 - (parseNumber (_out)) + tRandomCounter) % 1000000;
   ((_this select 0) * parseNumber ("0." + _out))
};

// Defaults
tort_initial = "cloudy";
tort_trend = "freeCycle";
tort_rndChange = [0, 0];
tort_variation = [0, 0.2, 1800];
tort_minMax = [0, 1, 0, 0.5, 0, 1];
tort_debugMode = 0;
tort_seed = 0;
tort_delaySeconds = 0;

_count = count _this;
if (_count > 0) then {tort_initial = _this select 0};
if (_count > 1) then {tort_trend = _this select 1};
if (_count > 2) then {tort_rndChange = _this select 2};
if (_count > 3) then {tort_variation = _this select 3};
if (_count > 4) then {tort_minMax = _this select 4};
if (_count > 5) then {tort_debugMode = _this select 5; if (tort_debugMode == 3) then {tort_debugMode = 100};};
if (_count > 6) then {tort_seed = (_this select 6) % 1000000};
if (tort_seed == 0) then {tort_seed = floor(random(1000000));}; seedVar = tort_seed;
if (_count > 7) then {tort_delaySeconds = _this select 7};

_minVari = tort_variation select 0; _maxVari = tort_variation select 1;
if ((count tort_variation) > 2) then {tort_transitionSpeed = (tort_variation select 2) * 60} else {tort_transitionSpeed = 1800};
_ocMin = tort_minMax select 0;_ocMax = tort_minMax select 1;
_fogMin = tort_minMax select 2; _fogMax = tort_minMax select 3;
_windMin = tort_minMax select 4; _windMax = tort_minMax select 5;

if (typeName tort_rndChange == "SCALAR") then {tort_rndChange = [tort_rndChange, 0]};

if (typeName tort_initial == "ARRAY") then {
   if ((typeName (tort_initial select 0)) == "STRING") then {
      tort_initial = (tort_initial select 0);
   } else {
      tort_overcast = tort_initial select 0; tort_fog = tort_initial select 1; tort_windStr = tort_initial select 2; tort_rain = tort_initial select 3; tort_windDir = [360] call tRandom;
      if isNil "tort_overcast" then {tort_overcast = [1] call tRandom;}; if isNil "tort_rain" then {tort_rain = 0}; if isNil "tort_fog" then {tort_fog = [1] call tRandom;}; if isNil "tort_windStr" then {tort_windStr = [1] call tRandom;};
      if (tort_overcast < 0) then {tort_overcast = [abs(tort_overcast)] call tRandom;};
      if (tort_fog < 0) then {tort_fog = [abs(tort_fog)] call tRandom;};
      if (tort_windStr < 0) then {tort_windStr = [abs(tort_windStr)] call tRandom;};
      if (tort_rain < 0) then {tort_rain = [abs(tort_rain)] call tRandom;};
   };
};

// Set initial weather presets
if (typeName tort_initial == "STRING") then {
   switch (tort_initial) do {
      case "clear": {tort_overcast = 0; tort_rain = 0; tort_fog = 0; tort_windStr = [0.1] call tRandom; tort_windDir = [360] call tRandom; tort_rain = 0};
      case "cloudy": {tort_overcast = 0.4 + ([0.15] call tRandom); tort_fog = ([0.015] call tRandom); tort_windStr = 0.2 + ([0.3] call tRandom); tort_windDir = ([360] call tRandom); tort_rain = 0};
      case "foggy":  {tort_overcast = 0.3 + ([0.15] call tRandom); tort_fog = 0.3 + ([0.2] call tRandom); tort_windStr = 0.3 + ([0.4] call tRandom); tort_windDir = [360] call tRandom; tort_rain = 0};
      case "bad": {tort_overcast = 0.8 + ([0.15] call tRandom); tort_fog = 0.1 + ([0.1] call tRandom); tort_windStr = 0.6 + ([0.4] call tRandom); tort_windDir = [360] call tRandom; tort_rain = 0.7 + ([0.3] call tRandom)};
      case "storm": {tort_overcast = 0.9 + ([0.1] call tRandom); tort_fog = [0.1] call tRandom; tort_windStr = 0.9 + ([0.1] call tRandom); tort_windDir = [360] call tRandom; tort_rain = 0.9 + ([0.1] call tRandom)};
      case "random": {tort_overcast = _ocMin + ([_ocMax-_ocMin] call tRandom); tort_windStr = _windMin + ([_windMax - _windMin] call tRandom); tort_windDir = [360] call tRandom;
                      tort_fog = _fogMin + (([1] call tRandom) * ([_fogMax - _fogMin] call tRandom));tort_rain = 0;}; // higher probability to lower fog values
      case "rndGood": {tort_overcast = ([0.5] call tRandom); tort_windStr = ([0.5] call tRandom); tort_windDir = [360] call tRandom;
                      tort_fog = (([0.5] call tRandom) * ([_fogMax - _fogMin] call tRandom)); tort_rain = 0;}; // higher probability to lower fog values
      case "rndBad": {tort_overcast = 0.5 + ([0.5] call tRandom); tort_windStr = 0.5 + ([0.5] call tRandom); tort_windDir = [360] call tRandom;
                      tort_fog = ((0.5 + ([0.5] call tRandom)) * ([_fogMax - _fogMin] call tRandom)); tort_rain = 0;}; // higher probability to lower fog values
      case "sunny": {tort_overcast = 0.3 + ([0.08] call tRandom); tort_fog = 0; tort_windStr = [0.2] call tRandom; tort_windDir = [360] call tRandom; tort_rain = 0;}; //sunny
      default {tort_overcast = 0.3; tort_fog = 0; tort_windStr = 0.1; tort_windDir = [360] call tRandom; tort_rain = 0;};
   };
};

// Fog related
_groundFogActive = false; currentTime = (date select 3) + ((date select 4)/60);
if ((currentTime > 8) && (currentTime < 20)) then {_daytime = true} else {_daytime = false};
if ((_groundfogBetween select 0) < (_groundfogBetween select 1)) then {
  if ((currentTime > (_groundfogBetween select 0)) && (currentTime < (_groundfogBetween select 1))) then {_groundFogActive = true;};
} else {
   if ((currentTime > (_groundfogBetween select 0)) || (currentTime < (_groundfogBetween select 1))) then {_groundFogActive = true;};
};
if (([1] call tRandom) < 0.05) then {_groundFogActive = !_groundFogActive};
fogDecay = (0.1 - ([0.02] call tRandom) - ([0.02] call tRandom) - ([0.02] call tRandom) - ([0.02] call tRandom) - ([0.02] call tRandom)) * tort_groundfog * ([1] call tRandom);
fogBase = (_fogMinHeight + ([_fogMaxHeight - _fogMinHeight] call tRandom)) * tort_groundfog;
if !(_groundFogActive) then {fogDecay = 0.01; fogBase = 0;};

// set constants to initial levels
tort_constantLevels = [tort_overcast, tort_fog, tort_windStr, tort_rain];

// This is not executed if not(applyInitialWeather) - this is when its called
// via a support menus Trend change.
if isNil "applyInitialWeather" then {applyInitialWeather = true};
if ((tort_debugMode <3) && applyInitialWeather) then {
   setWind [0.01, 0.01, true]; // wind must never be 0, because of bug in setwindstr
   // smooth transition from current state to initial weather
   // in abs(delaySeconds) if delaySeconds < 0
   if (tort_delaySeconds < 0) then {
      tort_delaySeconds = abs(tort_delaySeconds);
      tort_delaySeconds setOvercast tort_overcast; tort_delaySeconds setRain tort_rain;
      tort_delaySeconds setFog [tort_fog, fogDecay, fogBase];
      // setWindStr workaround. windStrength must never be 0
      if (tort_windStr == 0) then {tort_windStr = 0.01};
      tort_gusts = ([tort_windStr] call tRandom);
      0 setgusts tort_gusts;
      tort_delaySeconds setWindStr tort_windStr; tort_delaySeconds setWindDir tort_windDir;
      sleep tort_delaySeconds;
   }
   // apply initial weather immediately only if delaySeconds => 0.
   else
   {  sleep tort_delaySeconds;
      skiptime -24; 86400 setOvercast tort_overcast; skiptime 24;
      0 setRain tort_rain;
      //if ((simulCloudDensity (getPos player)) > 0.7) then {0 setRain tort_rain;};
      sleep 0.5;simulWeatherSync;sleep 0.5;ForceWeatherChange;sleep 0.5;
      0 setFog [tort_fog, fogDecay, fogBase];
      // setWindStr workaround. windStrength must never be 0
      if (tort_windStr == 0) then {tort_windStr = 0.01};
      tort_gusts = ([tort_windStr] call tRandom);
      0 setgusts tort_gusts;
      0 setWindStr tort_windStr; 0 setWindDir tort_windDir;
   };
};

// write 2 log lines to rpt
diag_log format ["TORT_DYNAMICWEATHER[ARGS] [%1, %2, %3, %4, %5, %6, %7]",_this select 0,_this select 1,_this select 2,_this select 3,_this select 4,_this select 5,_this select 6];
diag_log format ["TORT_DYNAMICWEATHER[SEED#%1][INITWEATHER] OC:%2 FOG:[%3,%4,%5] WSTR:%6 WDIR:%7 POS:%8",tort_seed,round(tort_overcast*100)/100,round(tort_fog*100)/100,round(fogDecay*100)/100,round(fogBase*100)/100,round(tort_windStr*100)/100,tort_windDir,getPos player];

if ((tort_debugMode > 0) && (tort_debugMode < 3)) then {
   hint format ["TORT_DYNAMICWEATHER [SEED#%1] Initial weather: Overcast %2 | Fog [%3, %4, %5] | Wind %6 | DebugMode %7",tort_seed,round(tort_overcast*100)/100,round(tort_fog*100)/100,round(fogDecay*100)/100,round(fogBase*100)/100,round(tort_windStr*100)/100,tort_debugMode]; sleep 10;
};


while {true} do {
   //if (tort_trend == "constant") then {_slices = 1} else {_slices = 1 + floor([4*tort_overcast] call tRandom);};
   if (tort_trend == "random") then {_slices = 1} else {_slices = 1 + floor(tort_transitionSpeed /60)};
   for "_i" from 1 to _slices do {
      if (tort_debugMode < 3) then {currentTime = (date select 3);};
      _randomEvent = (([1] call tRandom) < (tort_rndChange select 0));
      _groundFogActive = false;
      if ((_groundfogBetween select 0) < (_groundfogBetween select 1)) then {
        if ((currentTime > (_groundfogBetween select 0)) && (currentTime < (_groundfogBetween select 1))) then {_groundFogActive = true;};
      } else {
         if ((currentTime > (_groundfogBetween select 0)) || (currentTime < (_groundfogBetween select 1))) then {_groundFogActive = true;};
      };
      if ((currentTime > 8) && (currentTime < 20)) then {_daytime = true} else {_daytime = false};
      if (([1] call tRandom) < 0.05) then {_groundFogActive = !_groundFogActive};
      if (_groundFogActive) then {
         fogDecay = (0.15 - ([0.05] call tRandom) - ([0.05] call tRandom) - ([0.05] call tRandom));
         fogBase = (_fogMaxHeight - ([(0.25 * (_fogMaxHeight - _fogMinHeight))] call tRandom) - ([(0.25 * (_fogMaxHeight - _fogMinHeight))] call tRandom) - ([(0.25 * (_fogMaxHeight - _fogMinHeight))] call tRandom) - ([(0.25 * (_fogMaxHeight - _fogMinHeight))] call tRandom));
      } else {
         fogDecay = 0.01; fogBase = 0;
      };
      // Create random numbers for next forecast.
      if (_i == 1) then {
         _randOc = _minVari + ([_maxVari - _minVari] call tRandom);
         _randFog = _minVari + ([_maxVari - _minVari] call tRandom);
         _randWS = _minVari + ([_maxVari - _minVari] call tRandom);
         } else {
        _randOc = 0; _randFog = 0; _randWS = 0;
      };
      _randWD = round(((([90] call tRandom)-45)/ _slices) *10)/10;

// ######## RANDOM NEXT WEATHER ######## //
      if ((tort_trend == "random") || (_randomEvent)) then {
         _ignoreMinMax = (([1] call tRandom) < (tort_rndChange select 1));
         if (_ignoreMinMax) then {
            tort_overcast = [1] call tRandom;
            tort_fog = [1] call tRandom;
            tort_windStr = [1] call tRandom;
         } else {
            tort_overcast = _ocMin + ([_ocMax - _ocMin] call tRandom);
            tort_windStr = _windMin + ([_windMax - _windMin] call tRandom);
            if (_daytime) then {
               tort_fog = _fogMin + ((([_fogMax - _fogMin] call tRandom)) * ([1] call tRandom));
               // on not _randomEvent encounters, turn off fog completely
               if (_randomEvent && (([1] call tRandom) > (tort_overcast * 0.7))) then {tort_fog = _fogMin}; //often no fog
            } else {
               // nighttime: more fog possible
               tort_fog = _fogMin + ([_fogMax - _fogMin] call tRandom);
               // on not _randomEvent encounters, likely to turn off fog completely
               if (!_randomEvent && (([1] call tRandom) < (0.15))) then {tort_fog = _fogMin}; //sometimes no fog
            };
         tort_windStr = _windMin + ([_windMax - _windMin] call tRandom);
         };
      };

// ######## always oscillate between extremes ######## //
      if (tort_trend == "oscillate") then {
         _ignoreMinMax = (([1] call tRandom) < (tort_rndChange select 1));
         if (_ignoreMinMax) then {
            if (([1] call tRandom) < 0.9) then {
               if (tort_overcast < (_ocMin + (0.5 * (_ocMax-_ocMin)))) then {
                  tort_overcast = _ocMax - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_overcast = _ocMin + _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
            if (([1] call tRandom) < 0.9) then {
               if (tort_fog < (_fogMin + (0.5 * (_fogMax-_fogMin)))) then {
                  tort_fog = _fogMax - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_fog = _fogMin + _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
            if (([1] call tRandom) < 0.9) then {
               if (tort_windStr < (_windMin + (0.5 * (_windMax-_windMin)))) then {
                  tort_windStr = _windMax - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_windStr = _windMin + _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
         } else {
            if (([1] call tRandom) < 0.9) then {
               if (tort_overcast < 0.5) then {
                  tort_overcast = 1 - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_overcast = _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
            if (([1] call tRandom) < 0.9) then {
               if (tort_fog < 0.5) then {
                  tort_fog = 1 - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_fog = _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
            if (([1] call tRandom) < 0.9) then {
               if (tort_windStr < 0.5) then {
                  tort_windStr = 1 - _minVari - ([_maxVari - _minVari] call tRandom);
               } else {
                  tort_windStr = _minVari + ([_maxVari - _minVari] call tRandom);
               };
            };
         };
      };

// ######## CONSTANT NEXT WEATHER ######## //
      if (!_randomEvent && (tort_trend == "constant")) then {
         if (_maxVari == 0) then {
            // if no variance, immediately return back to constant value
            tort_overcast = (tort_constantLevels select 0) + _minVari - ([2 * _minVari] call tRandom);
            tort_fog = (tort_constantLevels select 1) + _minVari - ([2 * _minVari] call tRandom);
            tort_windStr = (tort_constantLevels select 2) + _minVari - ([2 *_minVari] call tRandom);
         } else {
            // move back to constant value in user def. variation steps
            tort_overcastPrev = tort_overcast; tort_fogPrev = tort_fog; tort_windStrPrev = tort_windStr;
            if (tort_overcast < ((tort_constantLevels select 0) - _maxVari)) then {
               tort_overcast = tort_overcast + _randOc;
               if (tort_overcast > ((tort_constantLevels select 0) + _maxVari)) then {tort_overcast = (tort_constantLevels select 0) + ([_maxVari] call tRandom)};
            };
            if (tort_overcast > ((tort_constantLevels select 0) + _maxVari)) then {
               tort_overcast = tort_overcast - _randOc;
               if (tort_overcast < ((tort_constantLevels select 0) - _maxVari)) then {tort_overcast = (tort_constantLevels select 0) - ([_maxVari] call tRandom)};
            };
            if (tort_fog < ((tort_constantLevels select 1) - _maxVari)) then {
               tort_fog = tort_fog + _randFog;
               if (tort_fog > ((tort_constantLevels select 1) + _maxVari)) then {tort_fog = (tort_constantLevels select 1) + ([_maxVari] call tRandom)};
            };
            if (tort_fog > ((tort_constantLevels select 1) + _maxVari)) then {
               tort_fog = (tort_constantLevels select 1) - _randFog;
               if (tort_fog < ((tort_constantLevels select 1) - _maxVari)) then {tort_fog = (tort_constantLevels select 1) - ([_maxVari] call tRandom)};
            };
            if (tort_windStr < ((tort_constantLevels select 2) - _maxVari)) then {
               tort_windStr = tort_windStr + _randWS;
               if (tort_windStr > ((tort_constantLevels select 2) + _maxVari)) then {tort_windStr = (tort_constantLevels select 2) + ([_maxVari] call tRandom)};
            };
            if (tort_windStr > ((tort_constantLevels select 2) + _maxVari)) then {
               tort_windStr = (tort_constantLevels select 2) - _randFog;
               if (tort_windStr < ((tort_constantLevels select 2) - _maxVari)) then {tort_windStr = (tort_constantLevels select 2) - ([_maxVari] call tRandom)};
            };
            if (tort_overcast == tort_overcastPrev) then {
               tort_overcast = (tort_constantLevels select 0) + _minVari - ([2 * _minVari] call tRandom)};
               if (tort_fog == tort_fogPrev) then {tort_fog = (tort_constantLevels select 1) + _minVari - ([2 * _minVari] call tRandom);
            };
            if (tort_windStr == tort_windStrPrev) then {tort_windStr = (tort_constantLevels select 2) + _minVari - ([2 *_minVari] call tRandom);};
            tort_windDir = tort_windDir + _randWD; if (tort_windDir >= 360 ) then {tort_windDir = tort_windDir - 360}; if (tort_windDir < 0) then {tort_windDir = 360 + tort_windDir};
         };
         if (tort_overcast < 0) then {tort_overcast = 0}; if (tort_overcast > 1) then {tort_overcast = 1};
         if (tort_fog < 0) then {tort_fog = 0}; if (tort_fog > 1) then {tort_fog = 1};
         if (tort_windStr < 0) then {tort_windStr = 0}; if (tort_windStr > 1) then {tort_windStr = 1};
      };

// ######## CYCLING WEATHER ######## //
      if (!_randomEvent && (tort_trend != "constant") && (tort_trend != "random")) then {
         switch (tort_trend) do {
            case "pBetter":
            {
               // 2/3 chance of weather getting better
               if (([3] call tRandom)>1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;};
               if (([4] call tRandom)>1) then {_randFog = -1 * _randFog};
               // if wrong direction, then gently
               if (_randOc > 0) then {_randOc = _randOc * ([1] call tRandom)};
               if (_randWS > 0) then {_randWS = _randWS * ([1] call tRandom)};
               if (_randFog > 0) then {_randFog = _randFog * ([1] call tRandom)};
            };
            case "pWorse": {
               // 2/3 chance of weather getting worse (except fog)
               if (([3] call tRandom)<1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;};
               if (([3] call tRandom)>1) then {_randFog = -1 * _randFog};
               // if wrong direction, then gently
               if (_randOc < 0) then {_randOc = _randOc * ([1] call tRandom)};
               if (_randWS < 0) then {_randWS = _randWS * ([1] call tRandom)};
               if (_randFog < 0) then {_randFog = _randFog * ([1] call tRandom)};
            };
            case "better": {
               _randOc = -1 * _randOc; _randWS = -1 * _randWS; _randFog = -1 * _randFog;
            };
            case "worse": {
               if (([5] call tRandom)>1) then {_randFog = -1 * _randFog};
            };
            case "freeCycle": {
               if (([2] call tRandom)>1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;_randFog = -1 * _randFog};
            };
         };
         // Create next random overcast level and keep it between borders
         // if value exceeds border, choose a new value between border and _maxVari
         tort_overcast = tort_overcast + _randOc;
         if (tort_overcast > _ocMax) then {tort_overcast = _ocMax - ([_maxVari] call tRandom)};
         if (tort_overcast < _ocMin) then {tort_overcast = _ocMin + ([_maxVari] call tRandom)};
         // Create next random fog level  //keep fog rather low
         tort_fog = tort_fog + _randFog;
         if (_groundFogActive) then {
            if (([1] call tRandom) < 0.5) then {tort_fog = _fogMin + ([_maxVari] call tRandom)};
         } else {
            if (([1] call tRandom) > (tort_overcast * 0.8)) then {tort_fog = _fogMin}; //often min fog at daytime
         };
         if (tort_fog > _fogMax) then {tort_fog = _fogMax - _minVari - ([_maxVari] call tRandom)};
         if (tort_fog < _fogMin) then {tort_fog = _fogMin};
         // Create next random Wind level
         tort_windStr = tort_windStr + _randWS;
         if (tort_windStr > _windMax) then {tort_windStr = _windMax - ([_maxVari] call tRandom)};
         if (tort_windStr < _windMin) then {tort_windStr = _windMin + ([_maxVari] call tRandom)};
      };

      // Create next random Wind Dir level and keep between [0 .. 360[
      if ((([1] call tRandom) > 0.8) || (tort_trend == "random") || (_randomEvent)) then {tort_windDir = ([360] call tRandom);} else {tort_windDir = tort_windDir + _randWD;};
      if (tort_windDir >= 360 ) then {tort_windDir = tort_windDir - 360};
      if (tort_windDir < 0) then {tort_windDir = tort_windDir + 360};

// ######## EXECUTE & DEBUG ########
      if ((tort_debugMode == 1) || (tort_debugMode == 2)) then {
         sleep 2;
         diag_log format ["TORT_DYNAMICWEATHER@%1s[SEED#%2][DONE IN MAX:%3s/%4s] OC:%5 FOG:[%6,%7,%8] WSTR:%9 WDIR:%10 POS:%11",time,tort_seed,floor(tort_transitionSpeed / _slices),tort_transitionSpeed,round(tort_overcast*100)/100,round(tort_fog*100)/100,round(fogDecay*100)/100,round(fogBase*100)/100,round(tort_windStr*100)/100,tort_windDir,getPos player];
         hint format ["[SEED#%1] [Time %2:%3h] Next weather: Overcast %4 | Fog [%5, %6, %7] | Wind %8 | Turbulence %9",tort_seed,date select 3,date select 4,round(tort_overcast*1000)/1000,round(tort_fog*1000)/1000,round(fogDecay*1000)/1000,round(fogBase*1000)/1000,round(tort_windStr*1000)/1000,_slices];
      };

      if (tort_debugMode < 2) then {
         // apply new weather
         if (_i == 1) then {tort_transitionSpeed setOvercast tort_overcast;}; //; floor(5 + ([30] call tRandom)) setRain 0
         (tort_transitionSpeed * (0.9 + ([0.1] call tRandom))) setFog [tort_fog, fogDecay, fogBase];
         // setWindStr workaround. windStrength must never be 0
         if (tort_windStr == 0) then {tort_windStr = 0.01};
         tort_gusts = ([tort_windStr] call tRandom);
         floor(tort_transitionSpeed / _slices) setgusts tort_gusts;
         if ((_i == 1) || (([overcast] call tRandom) > 0.3)) then {floor(tort_transitionSpeed * (0.9 + ([0.1] call tRandom))) setWindStr tort_windStr;};
         if ((_i == 1) || (([overcast] call tRandom) > 0.2)) then {floor(tort_transitionSpeed * (0.9 + ([0.1] call tRandom))) setWindDir tort_windDir;};
         sleep floor(tort_transitionSpeed / _slices);
      };

      if (tort_debugMode == 2) then {
         diag_log format ["TORT_DYNAMICWEATHER@%1s[SEED#%2][DONE IN MAX:%3s/%4s] OC:%5 FOG:[%6,%7,%8] WSTR:%9 WDIR:%10 POS:%11",time,tort_seed,floor(tort_transitionSpeed / _slices),tort_transitionSpeed,round(tort_overcast*100)/100,round(tort_fog*100)/100,round(fogDecay*100)/100,round(fogBase*100)/100,round(tort_windStr*100)/100,tort_windDir,getPos player];
         // apply weather quickly
         tort_transitionSpeed setOvercast tort_overcast;
         3 setRain 0; 3 setFog [tort_fog, fogDecay, fogBase];
         // setWindStr workaround. windStrength must never be 0
         if (tort_windStr == 0) then {tort_windStr = 0.01};
         3 setWindStr tort_windStr; 3 setWindDir tort_windDir;
         sleep 4; forceweatherchange; skiptime (1 / (2 * _slices));
      };

      if (tort_debugMode > 10) then {
         diag_log format ["TDW,%1, SEEDVAR,%2, TIME,%3, RND,%4, OC,%5, GFA,%6, FOGL,%7, FOGD,%8, FOGB,%9, WSTR,%10, WDIR,%11",rptlogCounter,seedvar,(floor(currentTime * 100))/100,_randomEvent,round(tort_overcast*100)/100,_groundFogActive,round(tort_fog*10000)/10000,round(fogDecay*10000)/10000,round(fogBase*100)/100,round(tort_windStr*100)/100,floor(tort_windDir)];
         hint format ["Value#%1 written to .rpt",rptlogCounter]; sleep 0.005;
         rptlogCounter = rptlogCounter + 1;
         thisLength = (round((tort_transitionSpeed / _slices)/36))/100;
         currentTime = (currentTime + thisLength) % 24;
      };
   };
   if ((rptlogCounter > tort_debugMode) && (rptlogCounter > 3)) then {hint format ["%1 values written to .rpt - quitting", tort_debugMode];};
   if ((rptlogCounter > tort_debugMode) && (rptlogCounter > 3)) exitWith {};
};