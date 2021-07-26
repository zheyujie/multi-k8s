docker build -t zheyujie/multi-client:latest t zheyujie/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t zheyujie/multi-server:latest t zheyujie/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t zheyujie/multi-worker:latest t zheyujie/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push zheyujie/multi-client:$SHA
docker push zheyujie/multi-server:$SHA
docker push zheyujie/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server:$SHA
kubectl set image deployments/client-deployment server=stephengrider/multi-client:$SHA
kubectl set image deployments/worker-deployment server=stephengrider/multi-worker:$SHA
