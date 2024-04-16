extends Node3D
@onready var http_request = $HTTPRequest

#https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}

func _ready():
	http_request.request_completed.connect(self._http_request_completed)

	http_request.request("https://api.openweathermap.org/data/2.5/weather?lat=40.739927&lon=-73.984892&units=imperial&appid=966e45351e9f1d75ab1dabe892fcdca8")
	# Perform a GET request. The URL below returns JSON as of writing.
	#var error = http_request.request("https://httpbin.org/get")
	#if error != OK:
		#push_error("An error occurred in the HTTP request.")
#
	## Perform a POST request. The URL below returns JSON as of writing.
	## Note: Don't make simultaneous requests using a single HTTPRequest node.
	## The snippet below is provided for reference only.
	#var body = JSON.new().stringify({"name": "Godette"})
	#error = http_request.request("https://httpbin.org/post", [], HTTPClient.METHOD_POST, body)
	#if error != OK:
		#push_error("An error occurred in the HTTP request.")

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)
	$Label3D.text = str(response.main.temp)
