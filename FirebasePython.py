from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app

# Configuración de Firebase
cred = credentials.Certificate("C:\Users\980006496\Downloads\reminders-aa9aa-firebase-adminsdk-r0ymc-800f35196f.json")
initialize_app(cred)
db = firestore.client()

app = Flask(__name__)

# Endpoint para obtener los datos desde Firebase
@app.route("/api/data", methods=["GET"])
def get_data():
    # Obtener la colección "data" de Firebase
    collection_ref = db.collection("data")
    data = [doc.to_dict() for doc in collection_ref.stream()]
    return jsonify(data)

# Endpoint para agregar datos a Firebase
@app.route("/api/data", methods=["POST"])
def add_data():
    new_data = request.json
    # Agregar los datos a la colección "data" de Firebase
    db.collection("data").add(new_data)
    return jsonify({"message": "Data added successfully"})

if __name__ == "__main__":
    app.run()
