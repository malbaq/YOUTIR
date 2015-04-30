
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("getQuotes", function(request, response) {
	var quotes = { "quotes" : [
		{ 	"carriers" : [
				{ 
					"carrierID" : "a1234567890",
		  	  		"carrierName" : "Dolinas", 
 		  	  		"transitRate" : 5000,
		  	  		"transitTime" : 5,
					"imageLogoPath" : "carrierName1.png",
					"carrierTel" : 74959000000,
					"carrierWeb" : "http://dedede.de"
				},
	  			{
		  	  		"carrierID" : "b2345678901",
		  	  		"carrierName" : "PEM", 
		  	  		"transitRate" : 5001,
		  	  		"transitTime" : 3,
					"imageLogoPath" : "carrierName2.png",
					"carrierTel" : 74959000000,
					"carrierWeb" : "http://dedede.de"
				},
				{
		  	  		"carrierID" : "c3456789012",
		  	  		"carrierName" : "PFX",
		  	  		"transitRate" : 5002,
		  	  		"transitTime" : 4,
					"imageLogoPath" : "carrierName3.png",
					"carrierTel" : 74959000000,
					"carrierWeb" : "http://dedede.de"
				}
	  		],
			"originCity" : "Moscow",
			"destinationCity" : "Tver",
			"weight"	: 10,
			"length" : 50,
			"width" : 20,
			"height" : 30,
			"insurance" : 10000
	  	}
  	]};
  response.success(quotes);
});