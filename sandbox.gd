extends Node3D

var url = "https://www.neowsapp.com/rest/v1/feed/today?detailed=true"

@onready var http_request = $HTTPRequest

func _ready():
	http_request.request_completed.connect(_on_request_completed)
	send_request()

func send_request():
	var headers = ["Content-Type: application/json"]
	http_request.request(url,headers,HTTPClient.METHOD_GET)

func pretty_print(json):
	var data = JSON.parse_string(json)
	if data == null:
		print("Failed to parse JSON")

func _on_request_completed(_results, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	#pretty_print(json)
	print(json)
