FROM python:3.11-slim
WORKDIR /app

#VIKTIGT: Vi måste hämta filerna inifrån application-mappen
COPY application/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#VIKTIGT: Vi kopierar innehållet i application-mappen till /app
COPY application/ .

EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
