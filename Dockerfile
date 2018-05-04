FROM python

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY jaeger-example.py /
ENTRYPOINT ["python", "/jaeger-example.py"]
