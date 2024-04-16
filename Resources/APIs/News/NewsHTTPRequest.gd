extends HTTPRequest

func topic_search(topic, date):
		var url = str("https://newsapi.org/v2/everything?q=",topic,"&from=",date,"&sortBy=popularity&apiKey=2fe268733b464e59ac8e70fd9e3c3dde")
		request(url)


# Called when the node enters the scene tree for the first time.
func _ready():
	topic_search("Obama", "2024-04-01")
	




func _on_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	var articles = response.articles
	for article in articles:
		print(article.title)
	
