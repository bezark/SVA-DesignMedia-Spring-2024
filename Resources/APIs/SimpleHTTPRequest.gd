extends HTTPRequest


# Called when the node enters the scene tree for the first time.
func _ready():
	request("https://www.google.com/")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_request_completed(result, response_code, headers, body):
	#print(result)
	#print(response_code)
	#print(headers)
	
	var html = body.get_string_from_utf8()
	print(html)
