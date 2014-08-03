class watchKnownPosition {};
			class initServer {
                    preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 1; // 1 to recompile the function upon mission start
            };
			class parameterInit {}; 
            class createComCenters {};
            class createAmmoDepots {};
			class handleJIP {};