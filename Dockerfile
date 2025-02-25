# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package list and install necessary dependencies
RUN apt update -y && apt install -y python3 python3-pip python3-venv

# Set the working directory inside the container
WORKDIR /app

# Copy application files to the container
COPY . /app/

# Create a virtual environment and activate it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies using pip inside the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80 for FastAPI
EXPOSE 80

# Run the FastAPI application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
