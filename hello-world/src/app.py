from flask import Flask

app = Flask(__name__)


@app.route('/healthz', methods=['GET'])
def it_is_alive():
    return "All Good!"


@app.route('/hello', methods=['GET'])
def say_hello():
    return "Hi!"


@app.route('/', methods=['GET'])
def root_path():
    return '<a href="/hello">Hello World!</a>'


if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
