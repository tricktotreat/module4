from bottle import route, run, view, response
from datetime import datetime as dt
from horoscope import generate_prophecies

# Маршрут для рендеринга фронтенда
@route("/")
@view("predictions")  # Указывает на шаблон predictions.tpl
def index():
    now = dt.now()
    return {
        "date": f"{now.year}-{now.month}-{now.day}"
    }

# Маршрут для API
@route("/api/predictions")
def api_predictions():
    now = dt.now()
    predictions = generate_prophecies(6, 2)

    response.content_type = 'application/json'
    return {
        "date": f"{now.year}-{now.month}-{now.day}",
        "predictions": predictions
    }

run(
    host="localhost",
    port=8080,
    debug=True
)
