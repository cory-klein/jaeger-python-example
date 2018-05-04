This is a tiny python app that you can use to play around with the Jaeger python client in a local Docker For Desktop Kubernetes cluster.

The idea is that you modify `jaeger-example.py` and then `run.sh` deploys it to your local cluster and logs its output to the console while you view traces it makes at http://localhost:8037

# Getting Started

Install the [Jaeger all-in-one Helm chart](https://github.com/cory-klein/jaeger-all-in-one-helm-chart):

```
# This changes the default Jaeger port so you can use port 80 for your own app if needed
helm install --set port=8037 https://github.com/cory-klein/jaeger-all-in-one-helm-chart/raw/master/jaeger-all-in-one-0.1.0.tgz
```

Run the example python app:

```
./run.sh
```

When you make a change to the example app, CTRL-C quit the `run.sh` script and re-run it. This will delete the previous example Deployment and install a new one.

# View Traces

View the traces in the [Jaeger UI](http://localhost:8037)
