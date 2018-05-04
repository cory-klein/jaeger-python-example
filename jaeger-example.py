import sys
import time
import logging
from jaeger_client import Config

def init_tracer(service):
    logging.getLogger('').handlers = []
    logging.basicConfig(format='%(message)s', level=logging.DEBUG)

    config = Config(
        config={
            'sampler': {
                'type': 'const',
                'param': 1,
            },
            'logging': True,
        },
        service_name=service,
    )

    # this call also sets opentracing.tracer
    return config.initialize_tracer()


def say_hello():
    with tracer.start_span('say-hello') as span:
        print("Sauce jaeger-example")
        time.sleep(1)

tracer = init_tracer('jaeger-example')

while True:
    say_hello()
    time.sleep(15)
