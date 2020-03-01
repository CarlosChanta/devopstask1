from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/greetings')
def greetingsTask1():
    return jsonify({'message':'Hello World from '})

@app.route('/square')
def squareTask1():
    return jsonify({'message':'number: X, square: Y'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000, debug=True)
