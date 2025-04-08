FROM python:3.10

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libx11-6 \
    xvfb \
    && apt-get clean

# Install Python packages
RUN pip install --no-cache-dir \
    flask==2.0.1 \
    werkzeug==2.0.3 \
    flask-socketio==5.1.1 \
    pynput==1.7.3 \
    pyautogui==0.9.53 \
    opencv-python==4.5.4.60 \
    numpy==1.21.2 \
    python-engineio==4.0.0 \
    python-socketio==5.0.4 \
    mss==6.1.0

# Copy application code
WORKDIR /app
COPY . .

# Run app with virtual display
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x16 & export DISPLAY=:99 && python app.py"]
