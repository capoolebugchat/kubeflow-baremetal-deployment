
cd manifests

sudo minikube start --kubernetes-version=1.20.0 --driver=none \
--extra-config=apiserver.service-account-signing-key-file=/var/lib/minikube/certs/sa.key \
--extra-config=apiserver.service-account-issuer=kubernetes.default.svc

while ! sudo ~/bin/kustomize_3.2.0_linux_amd64 build example | sudo kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done

sudo kubectl apply -f ./sec-and-accesses/https-gateway.yaml

sudo kubectl apply -f ./sec-and-accesses/config-gateway.yaml

sudo kubectl get pods --all-namespaces -w

