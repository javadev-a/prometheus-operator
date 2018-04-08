{
    new(namespace)::
        {
            "apiVersion": "monitoring.coreos.com/v1",
            "kind": "ServiceMonitor",
            "metadata": {
                "name": "kubelet",
                "namespace": namespace,
                "labels": {
                    "k8s-app": "kubelet"
                }
            },
            "spec": {
                "jobLabel": "k8s-app",
                "endpoints": [
                    {
                        "port": "https-metrics",
                        "scheme": "https",
                        "interval": "30s",
                        "tlsConfig": {
                            "insecureSkipVerify": true
                        },
                        "bearerTokenFile": "/var/run/secrets/kubernetes.io/serviceaccount/token"
                    },
                    {
                        "port": "https-metrics",
                        "scheme": "https",
                        "path": "/metrics/cadvisor",
                        "interval": "30s",
                        "honorLabels": true,
                        "tlsConfig": {
                            "insecureSkipVerify": true
                        },
                        "bearerTokenFile": "/var/run/secrets/kubernetes.io/serviceaccount/token"
                    }
                ],
                "selector": {
                    "matchLabels": {
                        "k8s-app": "kubelet"
                    }
                },
                "namespaceSelector": {
                    "matchNames": [
                        "kube-system"
                    ]
                }
            }
        }
}
