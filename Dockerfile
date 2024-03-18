#FROM python:3.8-slim
 
#WORKDIR /app
 
#COPY . /app
 
#RUN pip install --upgrade pip 

#RUN pip install -r requirements.txt
 
#EXPOSE 5000
 
#ENV FLASK_APP=app.py
 
#CMD ["flask", "run", "--host=0.0.0.0"]



# Use the official Python image as the base image
FROM python:3.9-slim
 
# Set the working directory in the container
WORKDIR /app
 
# Copy the requirements file into the container
COPY requirements.txt .
 
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
 
# Copy the FastAPI application code into the container
COPY app.py .
 
# Expose the port that FastAPI will run on
EXPOSE 8080
 
# Command to run the application using uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
