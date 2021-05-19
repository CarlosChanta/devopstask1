from flask import Flask, jsonify, render_template, request
import socket

app = Flask(__name__)

@app.route("/")
def homepage():
    return render_template("home.html", title="HOME PAGE")

@app.route('/greetings')
def greetingsTask1():
    return jsonify(Mensaje='Hello World from PC Name: '+socket.gethostname())

@app.route('/hello/<username>')
def hello_user(username):
    return 'Hello World my friend %s!\n' % username

@app.route('/square', methods=['POST'])
def squareTask1():
    number = request.json["numero"]
    return jsonify({'Resultado':'OK - Recibido!','number':number,'square':number**2})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000, debug=True)
