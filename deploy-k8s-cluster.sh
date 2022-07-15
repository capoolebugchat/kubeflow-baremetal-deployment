sudo minikube start --kubernetes-version=1.22.0 --driver=none \
--extra-config=apiserver.service-account-signing-key-file=/var/lib/minikube/certs/sa.key \
--extra-config=apiserver.service-account-issuer=kubernetes.default.svc

sudo kubectl proxy --address=0.0.0.0
