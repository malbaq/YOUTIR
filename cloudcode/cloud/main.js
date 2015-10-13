// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:

var pecom = require('cloud/pecom.js');
pecom.initialize('malbaq', '0E10B1576110C4EA3D1F745B7310191849220E26');

Parse.Cloud.define('calculatePecom', function(request, response) {
    pecom.calculatePrice( {
        'length' : 2.1,
        'width' : 3.2,
        'height' : 2.2,
        'Weight' : 3.3,
        'insurance' : 200.0
    }).then(function(httpResponse) {
        response.success("Calculated!");
    }, function(httpResponse) {
        console.error(httpResponse);
        response.error("Uh oh, something went wrong");
    });
});

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

Parse.Cloud.define("testCalculationRequest", function(request, response) {
    Parse.Cloud.httpRequest({
      method: 'POST',
      url: 'https://malbaq:0E10B1576110C4EA3D1F745B7310191849220E26@kabinet.pecom.ru/api/v1/calculator/calculateprice/',
      headers: {
        'Content-Type': 'application/json;charset=utf-8'
      },
      body: {
        "senderCityId": 446,
        "receiverCityId": 463,
        "Cargos": [{
            "length": 2.1,
            "width": 3.2,
            "height": 2.3,
            "weight": 10,
            "isOpenCarSender": false,
            "senderDistanceType": 0,
            "isDayByDay": false,
            "isOpenCarReceiver": false,
            "receiverDistanceType": 0,
            "isHyperMarket": false,
            "calcDate": "2014-01-21",
            "isInsurance": true,
            "isInsurancePrice": 234.15,
            "isPickUp": false,
            "isDelivery": false,
            "volume": 4.4,
            "maxSize": 3.2,
            "isHP": false,
            "sealingPositionsCount": 0,
            "overSize": false }]
      },
      success: function(httpResponse) {
        console.log(httpResponse.text);
        response.success()
      },
      error: function(httpResponse) {
        console.error('Request failed with response code ' + httpResponse.status);
        response.error()
      }
    });
});
