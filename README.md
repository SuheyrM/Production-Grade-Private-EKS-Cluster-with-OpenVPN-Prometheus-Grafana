## Production-Grade Private EKS Cluster with OpenVPN, GitOps, and Observability
This project demonstrates building a secure, production-grade private Kubernetes platform on AWS using Terraform, GitOps (ArgoCD), stateful applications (RabbitMQ), and full observability with Prometheus and Grafana.

## Architecture Diagram

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ede8ad9f-d255-4fd0-9594-2799ed7c41bb" />

```
User → OpenVPN → Private VPC → EKS Cluster → Kubernetes Workloads
                                      ↓
                               Prometheus → Grafana
```
## GitOps Integration
This project uses a separate GitOps repository to manage Kubernetes workloads:

👉 https://github.com/SuheyrM/eks-gitops

ArgoCD continuously syncs applications from this repository into the EKS cluster.

## GitOps Repository Structure
```
apps/
  demo-nginx/      # Stateless demo app (validates ArgoCD)
  rabbitmq/        # Stateful message broker (Helm chart)
  monitoring/      # Prometheus + Grafana stack
```
## Deployment Flow
```
Terraform → EKS Cluster → ArgoCD → GitHub (eks-gitops) → Kubernetes Apps
```

## Key Components:

 - VPC (10.0.0.0/16)

- Public Subnet
  - OpenVPN Server (EC2)
  - NAT Gateway

- Private Subnets
  - EKS Control Plane (Private endpoint)
  - Worker Nodes (EC2)

## Tech Stack
| Category   | Tool/Service             |
| ---------- | ------------------------ |
| Cloud      | AWS (EKS, VPC, EC2, NAT) |
| IaC        | Terraform                |
| GitOps     | ArgoCD                   |
| Monitoring | Prometheus + Grafana     |
| Messaging  | RabbitMQ                 |
| Language   | Python (pika)            |
| Container  | Docker / Kubernetes      |

## Secure Access (Private Cluster)
- EKS API is private-only
- Access is via OpenVPN server
- No public exposure of cluster resources

```
Laptop → VPN → Private Network → EKS
```

## GitOps Workflow (ArgoCD)
- Applications are defined in GitHub
- ArgoCD syncs cluster state automatically

Example app:
  <img width="1128" height="888" alt="argocd" src="https://github.com/user-attachments/assets/14afbb63-3db5-4c1c-8ccf-3df7cebe08e9" />

## RabbitMQ Deployment
- Deployed via Helm (Bitnami chart)
- Runs as a StatefulSet
- Persistent storage using EBS

Ports:

- 5672 → AMQP
- 15672 → UI
- 9419 → Metrics

RabbitMQ Management UI: 
<img width="1883" height="902" alt="RabbitMQ png" src="https://github.com/user-attachments/assets/164ba9a5-ff7d-46e9-b672-4bdaf739137d" />
RabbitMQ running inside the cluster with healthy node and resources

## Observability Stack

## Prometheus
  - Scrapes RabbitMQ metrics via ServiceMonitor

## Grafana

- Visualizes:
   - Queue size
   - Message rate
   - Node health

## Monitoring Pipeline
```
`RabbitMQ → ServiceMonitor → Prometheus → Grafana
```
## Screenshots

## Prometheus Metrics

<img width="1900" height="887" alt="promethus png" src="https://github.com/user-attachments/assets/8e874ddc-75dd-4d8f-95f7-d8079dd4a868" />

## Grafana Dashboard (RabbitMQ)

![grafana_9mb](https://github.com/user-attachments/assets/95bc6204-ea92-440d-b34b-6da9830bf528)


Real-time system activity showing message flow

- Ready messages: 50
- Incoming rate: Active
- Node health: Healthy

## Full Monitoring Stack 
<img width="1900" height="992" alt="grafana-dashboard png" src="https://github.com/user-attachments/assets/ed046030-9e88-45a3-a276-dbd72256905c" />

<img width="1918" height="1035" alt="grafana-list png" src="https://github.com/user-attachments/assets/95f0cbbd-7573-4a58-8565-171a9680ec67" />

## Python Consumer (Application Layer)
Location:
```
apps/rabbitmq-consumer/consumer.py
```
# Functionality:
- Connects to RabbitMQ
- Consumes messages from queue
- Demonstrates real workload

## End-to-End Flow

1. Message published to RabbitMQ
2. Python consumer reads message
3. Metrics generated
4. Prometheus scrapes metrics
5. Grafana visualizes data

## Infrastructure Deployment

Terraform 
```
cd terraform/environments/dev
terraform init
terraform apply
```
Destroy Infrastructure
```
terraform destroy
```

## Key Features
- Fully private EKS cluster
- Secure VPN-based access
- GitOps-driven deployments
- Stateful workloads (RabbitMQ)
- End-to-end observability
- Real application (Python consumer)

## Challenges & Solutions

### Private Cluster Access
- Challenge: No public access to EKS
- Solution: OpenVPN server inside VPC

### Metrics Not Appearing
- Challenge: Prometheus not scraping RabbitMQ
- Solution: Fixed ServiceMonitor label mismatch

### Queue Conflict (Durability)
- Challenge: RabbitMQ queue mismatch error
- Solution: Ensured consistent durable configuration

  
## Future Improvements
- Add Ingress + custom domain
- Add CI/CD pipeline (GitHub Actions)
- Containerize Python app
- Auto-scale RabbitMQ consumers
- Add alerts (Alertmanager)
