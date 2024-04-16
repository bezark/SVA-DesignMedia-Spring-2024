extends HTTPRequest


# Called when the node enters the scene tree for the first time.
func _ready():
	request("https://api.nasa.gov/planetary/apod?api_key=G7dulc9hHGtdjh8EdtFkHOa2MMVoSMdfzPl7OcMQ")
	


func _on_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)
	$ImageDownload.download(response.hdurl)
