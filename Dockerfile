# Use a lightweight base image with Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies first
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Then copy the rest of your application
COPY . .

# Apply migrations
RUN python manage.py migrate

# Expose port 8000 for the application
EXPOSE 8000

# Run the application
CMD python manage.py runserver 0.0.0.0:8000
