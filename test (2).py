from flask import Flask, request, jsonify
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report
import logging
import warnings

# Setup logging
logging.basicConfig(level=logging.DEBUG)

# Suppress warning about feature names
warnings.filterwarnings("ignore", category=UserWarning)

# Load your dataset
train_df = pd.read_csv('anemia.csv')

# Define input features (assuming all columns except 'Result' are features)
#input_features = train_df.columns[:-1].tolist()
input_features = ['Gender', 'Hemoglobin', 'MCH', 'MCHC', 'MCV']

# Prepare data for model training
x = train_df.drop('Result', axis=1)
y = train_df['Result']

# Split data into training and testing sets
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

# Train logistic regression model
clf = LogisticRegression()
clf.fit(x_train, y_train)

# Create Flask app
app = Flask(__name__)

# Endpoint for model information and training evaluation
@app.route('/ml', methods=['GET'])
def model_info():
    y_pred = clf.predict(x_test)
    accuracy = accuracy_score(y_test, y_pred)
    classification_rep = classification_report(y_test, y_pred, output_dict=True)
    response = {
        'accuracy': accuracy,
        'classification_report': classification_rep
    }
    return jsonify(response)

# Endpoint for making predictions
@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()

    # Debugging prints (consider using logging for production)
    app.logger.debug("Request data (raw): %s", request.data)
    app.logger.debug("Request data (JSON): %s", data)

    if not data:
        return jsonify({"error": "Invalid or missing JSON data"}), 400

    missing_params = [feature for feature in input_features if feature not in data]
    if missing_params:
        app.logger.debug("Missing parameters: %s", ', '.join(missing_params))
        return jsonify({"error": f"Missing parameters: {', '.join(missing_params)}"}), 400

    try:
        input_data = {feature: [float(data[feature])] for feature in input_features}
    except ValueError as e:
        app.logger.debug("Invalid parameter value: %s", str(e))
        return jsonify({"error": f"Invalid parameter value: {str(e)}"}), 400

    user_input = pd.DataFrame(input_data)
    prediction = clf.predict(user_input)

    result = {
        'prediction': int(prediction[0]),
        'message': 'The individual is likely to have anemia.' if prediction[0] == 1 else 'The individual is not likely to have anemia.'
    }

    return jsonify(result), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
