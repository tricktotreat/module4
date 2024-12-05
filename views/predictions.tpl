@route("/")
@view("predictions")
def index():
    now = dt.now()
    predictions = generate_prophecies(6, 2)  # Получаем предсказания
    return {
        "date": f"{now.year}-{now.month}-{now.day}",
        "predictions": predictions  # Передаем предсказания в шаблон
    }
