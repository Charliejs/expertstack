# Use the official Python image as a base
FROM python:3.11-slim

# Set environment variables to prevent Python from writing pyc files to disc
# and to ensure that Python outputs everything to the terminal (e.g., for logging)
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the project files into the container
COPY . /app/

# Expose port 8000 for the Django development server (or use another port)
EXPOSE 8000

# Command to run the Django server when the container starts
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# ... existing content ...

# Add this to the end of your Dockerfile
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000