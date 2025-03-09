# Projeto para provisionar uma cloud na AWS com terraform 🚀


Uma solução inovadora de computação em nuvem que une escalabilidade, alta disponibilidade e segurança por meio dos principais serviços da AWS.


## Ferramentas e Serviços Utilizados 🛠️


- **Amazon EC2 🖥️**  
  Hospeda a aplicação em instâncias virtuais, garantindo flexibilidade e performance.


- **Amazon Load Balancer 🔀**  
  Distribui o tráfego entre instâncias em três zonas de disponibilidade (us-east-1a, us-east-1b, us-east-1f), mantendo o serviço ativo mesmo em caso de falhas.


- **Amazon Auto Scaling 📈**  
  Ajusta automaticamente a quantidade de instâncias com base na demanda, operando entre um mínimo de 2 e um máximo de 3 instâncias, utilizando uma AMI Amazon Linux para otimização de custos.


- **Amazon RDS (Multi-AZ) 🗄️**  
  Gerencia conexões de banco de dados de forma confiável e segura, simplificando os backups e garantindo alta disponibilidade.


- **CloudFront 🌍**  
  Oferece uma distribuição rápida e eficiente de conteúdo estático para usuários em diversas regiões, minimizando a latência.


- **CloudWatch 📊**  
  Monitora continuamente as instâncias e suas métricas (como CPU, tráfego e número de instâncias ativas), configurando alertas para prevenir problemas.


- **Amazon IAM 🔐**  
  Controla o acesso aos recursos na AWS, implementando políticas de segurança e segregando privilégios entre usuários e sistemas.


## Por Que Escolhemos Essas Tecnologias? ✅


- **Amazon EC2 🖥️**  
  Proporciona ambientes virtuais robustos para a execução da aplicação com alta flexibilidade.


- **Amazon Load Balancer 🔀**  
  Garante a continuidade do serviço ao equilibrar o tráfego entre diferentes zonas, mesmo em situações de indisponibilidade.


- **Amazon Auto Scaling 📈**  
  Permite que o sistema se adapte automaticamente ao aumento ou queda de demanda, assegurando eficiência e desempenho.


- **Amazon RDS (Multi-AZ) 🗄️**  
  Facilita a gestão do banco de dados, promovendo alta disponibilidade e simplificando processos de manutenção e backup.


- **CloudFront 🌍**  
  Melhora significativamente a entrega de conteúdo, proporcionando uma experiência de usuário rápida e sem interrupções.


- **CloudWatch 📊**  
  Auxilia na identificação precoce de possíveis gargalos ou falhas, possibilitando a tomada de ações corretivas rapidamente.


- **Amazon IAM 🔐**  
  Reforça a segurança ao garantir que apenas usuários e sistemas autorizados tenham acesso aos recursos críticos.


## 🔧 Pré-Requisitos


Antes de começar, você precisa ter os seguintes softwares e configurações na sua máquina:


- **AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html**.
- **Terraform - https://www.terraform.io/**.


## 💻 Como rodar localmente


### 1 Clonando o repositório


Clone este repositório em sua máquina local:


``` git clone https://github.com/endmrf/scalable-web-application ```


1.1 Vá para a pasta do projeto


```cd scalable-web-application ```


1.2 Inicializando o projeto com Terraform
Se você quiser rodar o projeto diretamente com Terraform, execute o seguinte comando:


```terraform init```


1.3 Valide o projeto antes de aplicar as configurações na AWS


```terraform validate```


1.4 Aplique as configurações do projeto na AWS com o seguinte comando:


```terraform apply -y```


Isso irá aplicar as configurações na AWS.




## Considerações Finais 🌟


Esta arquitetura foi projetada para oferecer uma solução equilibrada entre custo, performance e segurança. Cada componente foi escolhido com base em critérios técnicos e econômicos, garantindo um ambiente robusto, preparado para lidar com altos volumes de acesso e imprevistos.


## Informações Extras 📚 (Opcional)


- **Como Destruir as configurações realizadas do Projeto:**
  
Execute o comando abaixo:

```terraform destroy```

## Equipe 👥


- Endryo Rodrigues - 2329031
- Francisco Artur - 2417046 
- Francisco Mateus  - 2416901
- Felipe Neres - 2327959





