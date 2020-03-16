from flask import Flask, jsonify, request
import socket

app = Flask(__name__)

@app.route('/greetings')
def greetingsTask1():
    return jsonify(Mensaje='Hello World from '+socket.gethostname())

@app.route('/square', methods=['POST'])
def squareTask1():
    number = request.json["numero"]
    return jsonify({'Resultado':'OK - Recibido!','number':number,'square':number**2})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000, debug=True)
