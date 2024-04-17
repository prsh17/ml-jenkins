# Use the official Python image as a base
FROM python:3.6.5-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements file to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project to the working directory
COPY . /app

# Command to run the application
CMD ["python", "/app/model.py", "&&", "python", "/app/server.py"]
