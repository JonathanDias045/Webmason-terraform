**Documentation Terraform et ansible**




# **Sommaire**
[Presentation Ansible	2******](#_toc167621238)***

[**1. Qu'est-ce que Terraform ?	2****](#_toc167621239)

[**2. Fonctionnalités Principales	2****](#_toc167621240)

[**3. Avantages	2****](#_toc167621241)

[**5. Usage de Base	3****](#_toc167621242)

[**6. Dossier a modifier pour créer ou suprimé une VM	3****](#_toc167621243)

[Paramètres Essentiels pour la Création d'une VM	4](#_toc167621244)

[**7. Communauté et Support	5****](#_toc167621245)

[**8. Conclusion	5****](#_toc167621246)

[***Présentation de Ansible	5******](#_toc167621247)

[**Introduction	5****](#_toc167621248)

[**Principales Caractéristiques	5****](#_toc167621249)

[**Architecture	5****](#_toc167621250)

[**Modification de Playbook package	6****](#_toc167621251)

[Modification des packages	6](#_toc167621252)

[Ajoutez ou suprimer une vm	9](#_toc167621253)

[Déclarer une vm	10](#_toc167621254)

[**Modification des utilisateur	11****](#_toc167621255)

[**Cas d'Utilisation	13****](#_toc167621256)

[**Avantages	13****](#_toc167621257)

[**Conclusion	13****](#_toc167621258)

[***Lien entre terraform et ansible	13******](#_toc167621259)

[**1. Configuration de Terraform	13****](#_toc167621260)

[**2. Script Shell pour Exécuter les Playbooks Ansible	13****](#_toc167621261)

[**3. Script Expect pour Gérer les Demandes de Mot de Passe	14****](#_toc167621262)

[***Lancé la création et la configuration des VM	14******](#_toc167621263)



# <a name="_toc167621238"></a>Presentation Ansible

Terraform est un outil d'infrastructure as code (IaC) développé par HashiCorp. Il permet aux utilisateurs de définir et de provisionner des infrastructures via un langage de configuration déclaratif. Voici une présentation détaillée de Terraform, couvrant ses fonctionnalités, avantages, et utilisation.

## <a name="_toc167621239"></a>1. Qu'est-ce que Terraform ?

Terraform est un outil open source utilisé pour construire, modifier et versionner l'infrastructure de manière sûre et efficace. Il utilise un langage de configuration appelé HashiCorp Configuration Language (HCL) pour décrire les ressources d'infrastructure.

## <a name="_toc167621240"></a>2. Fonctionnalités Principales

`    `Provisionnement Multi-Cloud : Terraform permet de gérer les infrastructures sur divers fournisseurs de cloud tels qu'AWS, Azure, Google Cloud, ainsi que des plateformes locales comme VMware.

`    `Déclaratif : Les utilisateurs définissent ce qu'ils veulent que l'infrastructure soit, et Terraform s'occupe du comment.

`    `Planification et Exécution : Terraform génère un plan d'exécution avant d'appliquer les modifications, permettant de voir les changements qui seront effectués.

`    `Modules : Réutilisation de configurations à travers des modules, facilitant la gestion et le partage de configurations standardisées.

`    `State Management : Terraform maintient l'état de l'infrastructure, ce qui permet de suivre les modifications et de gérer les dépendances.

## <a name="_toc167621241"></a>3. Avantages

`    `Automatisation : Réduit le besoin d'interventions manuelles, diminuant ainsi les erreurs humaines.

`    `Portabilité : Les configurations peuvent être appliquées sur différents fournisseurs de cloud sans modifications significatives.

`    `Versioning : Les configurations peuvent être versionnées et partagées, ce qui facilite la collaboration et la gestion des modifications.

`    `Idempotence : Les opérations Terraform sont idempotentes, garantissant que l'exécution d'un plan plusieurs fois donnera le même résultat.

4\. Architecture

`    `Configuration Files : Les fichiers de configuration, écrits en HCL, décrivent les ressources et les dépendances.

`    `State File : Terraform génère un fichier d'état qui stocke les informations sur les ressources gérées.

`    `Provider Plugins : Des plugins pour chaque fournisseur de services cloud ou plateforme, permettant de traduire les configurations en API calls spécifiques.

## <a name="_toc167621242"></a>5. Usage de Base

`    `Installation : Téléchargez et installez Terraform depuis le site officiel.

`    `Configuration : Créez des fichiers de configuration .tf pour définir les ressources.

`    `Initialization : Initialisez le répertoire de travail avec terraform init.

`    `Planification : Générez et révisez un plan d'exécution avec terraform plan.

`    `Application : Appliquez les modifications avec terraform apply.

`    `Destruction : Détruisez l'infrastructure gérée avec terraform destroy si nécessaire.



## <a name="_toc167621243"></a>6. Dossier a modifier pour créer ou suprimé une VM

Le fichier `nodes.auto.tfvars.json` permet de créer ou supprimer des machines virtuelles (VM).

Pour accéder à ce fichier, suivez ces étapes :

1\. Allez dans le répertoire suivant en utilisant la commande :

`   ````bash

`   `cd /home/mbureau/Webmason-terraform/terraform/

`   ````

2\. Une fois dans ce dossier, vous pouvez modifier le fichier `nodes.auto.tfvars.json` avec votre éditeur préféré.

Le contenu du fichier est le suivant :

{

`  `"password": "Password",

`  `"ssh\_public\_keys": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2c18uyQwwLoP5jQz2AMBtMFhZDPt7wcoNG38BwylxirItHE7jGlWl3Yf924Q7zpVcPyIVHKtQv3RZ1aF7u5SojGPJ+iOisPCg0K4n/OVNuRbgY4Ig4LAwJGkTAnC7ZOy3BQPUIbAu7n1RqFzDNI+/T8GdzJ7U3Trk+JmDjkLTJuK32DBjVig3oE0EmmAMcIMC1jd2QLrRnmN1a4TzhtFdPyCqJeJdhHFFJPgQb2zqmj9094z6vxWnU0scHbOUQrRgE77oi+UvsbXnrr+WCRldvZj9jf6wrAak6HXIDAjsnZ5HB7RVcAR5dUKGrTCJcCkLOetxf1HmFXs0EJ2oGC4jPO4GaALPSV11HTCCUQt07aS0tEk6qqxLvhLz3KrFuKnS8vtRTUsdESKczArxd3BaXwgDtuRWUbPhIMnR27JKL6UMTUEVvfRb4rYu1LdxRuxt1JLumwQlWjjFE4T30S11oaR/Ck1954tNCF1wwjmjqomUa2Xq/cXUUMmf+7SzUoU= mbureau@webmason",

`  `"target\_node": "cfai2024",

`  `"pool": "jdias",

`  `"containers": [

`    `{

`      `"name": "bdd",

`      `"cpuunits": 256,

`      `"rootfs\_size": "2G",

`      `"memory": 256,

`      `"ostemplate": "local:vztmpl/debian-12-standard\_12.2-1\_amd64.tar.zst",

`      `"ip6": "2a03:5840:111:1024:caca:caca:caca:0001/64"

`    `},

`    `{

`      `"name": "vitrine",

`      `"cpuunits": 256,

`      `"rootfs\_size": "2G",

`      `"memory": 256,

`      `"ostemplate": "local:vztmpl/debian-12-standard\_12.2-1\_amd64.tar.zst",

`      `"ip6": "2a03:5840:111:1024:caca:caca:caca:0002/64"

`    `},

`    `{

`      `"name": "gestion",

`      `"cpuunits": 256,

`      `"rootfs\_size": "2G",

`      `"memory": 256,

`      `"ostemplate": "local:vztmpl/debian-12-standard\_12.2-1\_amd64.tar.zst",

`      `"ip6": "2a03:5840:111:1024:caca:caca:caca:0003/64"

`    `}

`  `]

}


### <a name="_toc167621244"></a>Paramètres Essentiels pour la Création d'une VM
1. **Nom de la VM (name)**
   1. **Description** : Identifie la machine virtuelle. Ce nom est utilisé pour distinguer cette VM des autres dans votre infrastructure.
   1. **Exemple** : "my-vm"
1. **CPU Units (cpuunits)**
   1. **Description** : Quantité d'unités CPU allouée à la VM. Plus le nombre est élevé, plus la VM reçoit de cycles CPU.
   1. **Exemple** : 256
1. **Taille du Système de Fichiers Racine (rootfs\_size)**
   1. **Description** : Espace disque alloué pour le système d'exploitation et les fichiers système de la VM.
   1. **Exemple** : "20G" (20 gigaoctets)
1. **Mémoire (memory)**
   1. **Description** : Quantité de mémoire vive (RAM) allouée à la VM.
   1. **Exemple** : 2048 (2048 mégaoctets ou 2 Go)
1. **Modèle de Système d'Exploitation (ostemplate)**
   1. **Description** : Image ou modèle de système d'exploitation utilisé pour créer la VM.
   1. **Exemple** : "local:vztmpl/ubuntu-20.04-standard\_20.04-1\_amd64.tar.zst"
1. **Adresse IP (ip)**
   1. **Description** : Adresse IP assignée à la VM pour la connectivité réseau.
   1. **Exemple** : "192.168.1.100/24" pour IPv4 ou "2a03:5840:111:1024::1/64" pour IPv6

## <a name="_toc167621245"></a>7. Communauté et Support

Terraform dispose d'une large communauté d'utilisateurs et de contributeurs. HashiCorp propose également une version entreprise avec des fonctionnalités avancées et un support commercial.
## <a name="_toc167621246"></a>8. Conclusion

Terraform est un outil puissant pour la gestion de l'infrastructure en tant que code, offrant des fonctionnalités robustes pour le provisionnement et la gestion de ressources sur divers fournisseurs de cloud. Sa nature déclarative et sa capacité à gérer l'état en font un choix privilégié pour les DevOps et les équipes d'ingénierie souhaitant automatiser et standardiser leurs infrastructures.


# <a name="_toc167621247"></a>Présentation de Ansible
## <a name="_toc167621248"></a>Introduction
Ansible est un outil open-source d'automatisation informatique. Il permet de gérer la configuration, le déploiement et l'orchestration de systèmes informatiques de manière simple et efficace. Créé par Michael DeHaan en 2012, Ansible est maintenu par Red Hat depuis son acquisition en 2015.
## <a name="_toc167621249"></a>Principales Caractéristiques
1. **Agentless (sans agent)**: Contrairement à certains outils d'automatisation, Ansible ne nécessite pas l'installation d'agents sur les machines gérées. Il utilise SSH pour la communication, simplifiant ainsi la gestion et la sécurité.
1. **Facilité d'utilisation**: Ansible utilise des fichiers YAML pour définir les tâches d'automatisation. Ces fichiers, appelés playbooks, sont simples à écrire et à lire, même pour les non-développeurs.
1. **Idempotence**: Ansible assure que les tâches sont idempotentes, c'est-à-dire que leur exécution multiple n'aura pas d'effet supplémentaire. Cela garantit que les systèmes atteignent et maintiennent l'état désiré.
1. **Modulaire**: Ansible est extensible via des modules. Il existe une vaste bibliothèque de modules pour diverses tâches (gestion de fichiers, configuration réseau, installation de logiciels, etc.).
## <a name="_toc167621250"></a>Architecture
- **Control Node**: La machine à partir de laquelle les commandes Ansible sont exécutées.
- **Managed Nodes**: Les machines cibles gérées par Ansible.
- **Playbooks**: Fichiers YAML contenant une ou plusieurs plays. Chaque play contient un ensemble de tâches à exécuter sur les managed nodes.
- **Modules**: Petits programmes qui accomplissent des tâches spécifiques (par exemple, installation de packages, gestion de services).
## <a name="_toc167621251"></a>Modification de Playbook package

### <a name="_toc167621252"></a>Modification des packages

Le fichier ` install\_packages.yaml` permet de créer ou des packages sur les vm

Pour accéder à ce fichier, suivez ces étapes :

1\. Allez dans le répertoire suivant en utilisant la commande :

`   ````bash

`   `cd / /home/mbureau/Webmason-terraform/ansible/ansible-webmason/WebMason/playbooks   ```

2\. Une fois dans ce dossier, vous pouvez modifier le fichier ` install\_packages.yaml ` avec votre éditeur préféré.

Le contenu du fichier est le suivant :

\---

\- name: Install prerequisites and configure services

`  `hosts: all

`  `become: true

`  `tasks:

`    `- name: Ensure prerequisites and required packages are installed

`      `apt:

`        `name:

`          `- gnupg

`          `- wget

`          `- lsb-release

`        `state: present

`        `update\_cache: yes

`      `when: ansible\_os\_family == "Debian"

\- name: Configure Apache on web servers

`  `hosts: web:web2

`  `become: true

`  `tasks:

`    `- name: Install Apache

`      `apt:

`        `name: apache2

`        `state: present

`        `update\_cache: yes

`    `- name: Start and enable Apache service

`      `service:

`        `name: apache2

`        `state: started

`        `enabled: true

`    `- name: Copy HTML and CSS files to web root on web

`      `copy:

`        `src: "{{ item.src }}"

`        `dest: "{{ item.dest }}"

`        `owner: www-data

`        `group: www-data

`        `mode: '0644'

`      `loop:

`        `- { src: 'files/index.html', dest: '/var/www/html/index.html' }

`        `- { src: 'files/styles.css', dest: '/var/www/html/styles.css' }

`      `when: inventory\_hostname in groups['web']

`    `- name: Copy HTML and CSS files to web root on web2

`      `copy:

`        `src: "{{ item.src }}"

`        `dest: "{{ item.dest }}"

`        `owner: www-data

`        `group: www-data

`        `mode: '0644'

`      `loop:

`        `- { src: 'files/web2/index.html', dest: '/var/www/html/index.html' }

`        `- { src: 'files/web2/styles.css', dest: '/var/www/html/styles.css' }

`      `when: inventory\_hostname in groups['web2']

\- name: Install and configure phpMyAdmin on MySQL server

`  `hosts: phpmyadmin

`  `become: true

`  `tasks:

`    `- name: Install PHP and required extensions

`      `apt:

`        `name:

`          `- php

`          `- php-mbstring

`          `- php-zip

`          `- php-gd

`          `- php-json

`          `- php-curl

`        `state: present

`        `update\_cache: yes

`    `- name: Install Apache

`      `apt:

`        `name: apache2

`        `state: present

`        `update\_cache: yes

`    `- name: Start and enable Apache service

`      `service:

`        `name: apache2

`        `state: started

`        `enabled: true

`    `- name: Install phpMyAdmin

`      `apt:

`        `name: phpmyadmin

`        `state: present

`        `update\_cache: yes

`    `- name: Ensure phpMyAdmin configuration is included in Apache

`      `blockinfile:

`        `path: /etc/apache2/apache2.conf

`        `block: |

`          `# phpMyAdmin Configuration

`          `Include /etc/phpmyadmin/apache.conf

`    `- name: Configure Apache to redirect the default page to phpMyAdmin

`      `blockinfile:

`        `path: /etc/apache2/sites-available/000-default.conf

`        `insertafter: '^<VirtualHost \\*:80>$'

`        `block: |

`          `# Redirect the default page to phpMyAdmin

`          `RedirectMatch ^/$ /phpmyadmin/

`    `- name: Restart Apache to apply changes

`      `service:

`        `name: apache2

`        `state: restarted

`        `enabled: true

explication pour modifier :

\---

\- name: Installer et démarrer Apache

`  `hosts: webservers

`  `become: yes

`  `tasks:

`  `- name: Installer Apache

`    `apt:

`      `name: apache2

`      `state: present

`  `- name: Démarrer le service Apache

`    `service:

`      `name: apache2

`      `state: started

1. **Déclaration de base (---)**:
   1. Indique le début d'un document YAML. Cela permet à Ansible de comprendre que ce qui suit est un playbook.
1. **Définition d'une play (- name: Installer et démarrer Apache)**:
   1. Chaque play commence par - name: suivi d'une description de la play.
   1. name: Installer et démarrer Apache : Donne un nom descriptif à cette play, expliquant qu'elle installera et démarrera Apache.
1. **Définition des hôtes cibles (hosts: webservers)**:
   1. hosts: webservers : Spécifie que cette play doit être exécutée sur les hôtes appartenant au groupe webservers. Ce groupe est défini dans votre fichier d'inventaire Ansible.
1. **Privilèges élevés (become: yes)**:
   1. become: yes : Indique que les tâches doivent être exécutées avec des privilèges élevés (souvent équivalent à sudo). Cela est nécessaire pour installer des paquets et gérer des services sur les systèmes cibles.
1. **Liste des tâches (tasks:)**:
   1. Les tâches à exécuter sur les hôtes cibles sont listées sous cette section. Chaque tâche est une action spécifique.
1. **Installer Apache (- name: Installer Apache)**:
   1. name: Installer Apache : Donne un nom descriptif à cette tâche.
   1. apt: : Utilise le module apt pour les systèmes basés sur Debian (comme Ubuntu). Si vous utilisez un système basé sur Red Hat (comme CentOS), vous utiliseriez le module yum ou dnf.
   1. name: apache2 : Spécifie le nom du paquet à installer.
   1. state: present : Assure que le paquet est installé. Si apache2 n'est pas installé, Ansible l'installera.
1. **Démarrer le service Apache (- name: Démarrer le service Apache)**:
   1. name: Démarrer le service Apache : Donne un nom descriptif à cette tâche.
   1. service: : Utilise le module service pour gérer les services système.
   1. name: apache2 : Spécifie le nom du service à gérer.
   1. state: started : Assure que le service est démarré. Si le service n'est pas en cours d'exécution, Ansible le démarrera.
### <a name="_toc167621253"></a>Ajoutez ou suprimer une vm

Pour ajouter ou supprimer une machine virtuelle, vous devez vous rendre dans le dossier host\_vars et créer un fichier .yaml portant le nom de la VM. Pour accéder à ce fichier, suivez ces étapes :

1\. Allez dans le répertoire suivant en utilisant la commande :

`   ````bash

`   `cd / /home/mbureau/Webmason-terraform/ansible/ansible-webmason/WebMason/host\_vars   ```

2\. ```bash

`   `Nano (nom de la vm).yaml

`   ````


Exemple de contenue du fichier :

host: webmason-bdd.final.cfai24.ajformation.fr

login: root

- Pour host, vous devez entrer l'adresse IP du serveur ou le FQDN (Fully Qualified Domain Name).
- Pour login, il est recommandé d'utiliser root afin de disposer des permissions nécessaires pour installer les packages et gérer les utilisateurs.

### <a name="_toc167621254"></a>Déclarer une vm

Le fichier ` inventory.yaml ` permet de créer ou des packages sur les vm

Pour accéder à ce fichier, suivez ces étapes :

1\. Allez dans le répertoire suivant en utilisant la commande :

`   ````bash

`   `cd / /home/mbureau/Webmason-terraform/ansible/ansible-webmason/WebMason/host\_vars   ```

2\. Une fois dans ce dossier, vous pouvez modifier le fichier ` inventory.yaml ` avec votre éditeur préféré.

Contenu du fichier :

all:

`  `vars:

`    `ansible\_ssh\_common\_args: '-o ServerAliveInterval=50 -o ServerAliveCountMax=10'

web:

`  `hosts:

`    `vitrine:

`      `ansible\_host: "{{ host }}"

`      `ansible\_user: "{{ login }}"

web2:

`  `hosts:

`    `gestion:

`      `ansible\_host: "{{ host }}"

`      `ansible\_user: "{{ login }}"

phpmyadmin:

`  `hosts:

`    `bdd:

`      `ansible\_host: "{{ host }}"

`      `ansible\_user: "{{ login }}"

cfai:

`  `children:

`    `web:

`    `web2:

`    `phpmyadmin:



·  **Définition du groupe phpmyadmin**

- **phpmyadmin:**
  - Déclare un groupe d'hôtes nommé phpmyadmin.
- **hosts:**
  - Liste les hôtes ou groupes d'hôtes sous ce groupe.
- **bdd:**
  - Nom d'un hôte ou sous-groupe d'hôtes sous phpmyadmin.
- **ansible\_host: "{{ host }}"**
  - Utilise la variable globale host pour définir l'adresse de l'hôte.
- **ansible\_user: "{{ login }}"**
  - Utilise la variable globale login pour définir l'utilisateur de connexion.

·  **Définition du groupe cfai**

- **cfai:**
  - Déclare un groupe d'hôtes nommé cfai.
- **children:**
  - Spécifie que ce groupe inclut d'autres groupes comme sous-groupes.
- **- phpmyadmin**
  - Inclut le groupe phpmyadmin comme sous-groupe de cfai.


## <a name="_toc167621255"></a>Modification des utilisateur

Le fichier ` all.yaml ` permet de créer ou des packages sur les vm

Pour accéder à ce fichier, suivez ces étapes :

1\. Allez dans le répertoire suivant en utilisant la commande :

`   ````bash

`   `cd / /home/mbureau/Webmason-terraform/ansible/ansible-webmason/WebMason/group\_vars   ```

2\. Une fois dans ce dossier, vous pouvez modifier le fichier ` all.yaml ` avec votre éditeur préféré.

Contenu du fichier :

default\_shell: /bin/bash

myusers:

`  `- login: mbureau

`    `pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXdtB+M6QXOtqTFm9SnoOVmaDwyHbS2L8LIFo6bXDA9bmIfVaI0z9HxMFYOzP+nCIKHWGeolng9jtGsb5HG3kJIdyh1oJyA7uusB2QdgffsMrRi40m7rgJ+SqwdT6UradbtbBftV8PUrWW/lrAERk2vG9a3PhqdZK294Ne6+dqP5e2n83IJazdNgwH4TtjpeZv3/wQ3kcZqQ0SAYD6DEeBCo2cq9Iltx3YFG7yB9yFB2MOuK+6+p/w2QvjKumaWHv3/8iFNFhjg8Vw9auOu4VHgAhqoySZLKXvbZWAW9qPqJ2TTwSesb2Z4ykiRcEPT+4IiyQUdfvs+WijxpTcvuUl36kXb6t6RHcl6ruKUw+CRQIjvqwzg32UqcB17NSBghjMJNjv2/8PpOkh++wQXOY2c5Lyt87Izds5dKH31CZKjug6ZdCGbkUniVNcOhSWsHQiNqWPxzwpxsEmJTEjjr26E76Dj71HHwzCxRC5argM/tymnLQuRdbQqywJ9e9+ZxFWuBWuJITDn1tYFhDoMD8t8AwiAi+m1re3lw6pgckhpZ0J4JHmy4vnEEk/6BNfgGrXLcqkKfSz4ZytA8sC7yuC9yc9GaoES62xaMDfOpyyMF0xvKdEoNAqBsf9xVY0S0CqqM+eX/tsMwegdqWAITkGmWEW4V+LVo6S2PaEdL+4fQ== bastien@MacBook-Air-de-Bastien.local

`    `groups: sudo, \_ssh

`  `- login: jdias

`    `pubkey: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE5i68nOFjp7fkqqSctterFi9v5RgQ0YvXIqv3QimGYG utilisateur@DESKTOP-HRJ54SO

`    `groups: sudo, \_ssh

`  `- login: bfayant

`    `pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXdtB+M6QXOtqTFm9SnoOVmaDwyHbS2L8LIFo6bXDA9bmIfVaI0z9HxMFYOzP+nCIKHWGeolng9jtGsb5HG3kJIdyh1oJyA7uusB2QdgffsMrRi40m7rgJ+SqwdT6UradbtbBftV8PUrWW/lrAERk2vG9a3PhqdZK294Ne6+dqP5e2n83IJazdNgwH4TtjpeZv3/wQ3kcZqQ0SAYD6DEeBCo2cq9Iltx3YFG7yB9yFB2MOuK+6+p/w2QvjKumaWHv3/8iFNFhjg8Vw9auOu4VHgAhqoySZLKXvbZWAW9qPqJ2TTwSesb2Z4ykiRcEPT+4IiyQUdfvs+WijxpTcvuUl36kXb6t6RHcl6ruKUw+CRQIjvqwzg32UqcB17NSBghjMJNjv2/8PpOkh++wQXOY2c5Lyt87Izds5dKH31CZKjug6ZdCGbkUniVNcOhSWsHQiNqWPxzwpxsEmJTEjjr26E76Dj71HHwzCxRC5argM/tymnLQuRdbQqywJ9e9+ZxFWuBWuJITDn1tYFhDoMD8t8AwiAi+m1re3lw6pgckhpZ0J4JHmy4vnEEk/6BNfgGrXLcqkKfSz4ZytA8sC7yuC9yc9GaoES62xaMDfOpyyMF0xvKdEoNAqBsf9xVY0S0CqqM+eX/tsMwegdqWAITkGmWEW4V+LVo6S2PaEdL+4fQ== bastien@MacBook-Air-de-Bastien.local

`    `groups: sudo, \_ssh

`  `- login: fbouloumie

`    `pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrPnKKEB/rRdTzaBPHOPMq56tRf3MxutmVIQUGZij8U1dWffLYgpQjK4k+UygAZfYoYNiWRNkxBrK4ddqGtFqhRBY3IBTkHObGCS4yd6FvTcHsOut4Wog3P96KaEg4dNkMCVxCP8P/K6hqKqqznoL8hsBOAZPhdKqD6GRDzzBRzVtcrNw8/WKrlH3+pE3OJOZP7q9w+IeZFJh3WKEbqwMVzbtieaDffaU84LSONunpOs4RhlfAbG2QAKCKJh01uUOgFK4uBN4Q31Fj1yRAigGorv8NtIhTc51cC3C5jPxdh55vSSUuTXXqMgeyD8L2gvLBPNgh2VH0lfSNEFX5Iss821Zbnl/KI3XwXoiMnZO12le8KOKi0y73LAAmVEglaHVCluGnf1cTq3LLkLJArmYfE2Rvgf9o0JEsxpCixa06QHF6Z3SJVk6lHrLcce5YqRxxzjLxqXfU8dqdMM7M4pmwQh5FkKrOzcogWMSTPXWwmWmofVb4Gd1ZfQ30CTCnD0M= francois@DESKTOP-296E9TG

`    `groups: sudo, \_ssh

`  `- login: javond

`    `pubkey: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnoxKR7llvIC/zepZokSb2FyqO69BVCiFAWKTULE4bL jerome@djay

`    `groups: sudo, \_ssh

- **"username: "nom\_d\_utilisateur"** :
  - Nom de l'utilisateur à créer. Vous devez remplacer "nom\_d\_utilisateur" par le nom réel de l'utilisateur.
- **ssh\_public\_key: "clé\_ssh\_publique"** :
  - Clé publique SSH à ajouter pour cet utilisateur. Remplacez "clé\_ssh\_publique" par la clé SSH publique réelle.
- **user\_groups: "sudo, \_ssh"** :
  - Groupes auxquels l'utilisateur sera ajouté. Les groupes sont séparés par des virgules. Remplacez par les groupes réels requis.


## <a name="_toc167621256"></a>Cas d'Utilisation
1. **Gestion de Configuration**: Maintenir la configuration des systèmes de manière cohérente et sécurisée.
1. **Déploiement d'Applications**: Automatiser le déploiement d'applications à grande échelle.
1. **Orchestration**: Coordonner l'exécution de tâches multiples sur des environnements distribués.
1. **Automatisation de tâches répétitives**: Réduire les erreurs et améliorer l'efficacité en automatisant les tâches récurrentes.
## <a name="_toc167621257"></a>Avantages
- **Simplicité**: Interface utilisateur intuitive et langage simple basé sur YAML.
- **Flexibilité**: Peut gérer différents environnements (cloud, on-premises, hybrid).
- **Communauté active**: Large communauté avec de nombreux contributeurs et ressources.
## <a name="_toc167621258"></a>Conclusion
Ansible est un outil puissant pour l'automatisation de l'infrastructure informatique. Son approche agentless, sa simplicité d'utilisation et sa flexibilité en font un choix privilégié pour de nombreuses organisations cherchant à améliorer leur efficacité opérationnelle et à réduire les erreurs humaines.

# <a name="_toc167621259"></a>Lien entre terraform et ansible

## <a name="_toc167621260"></a>1. Configuration de Terraform
Dans le fichier container.tf, nous avons utilisé le provisioner local-exec pour appeler un script shell local après la création d'un conteneur LXC avec Proxmox. Cela garantit que les playbooks Ansible sont exécutés uniquement après la création réussie du conteneur.
## <a name="_toc167621261"></a>2. Script Shell pour Exécuter les Playbooks Ansible
Un script shell (run\_ansible.sh) est utilisé pour configurer l'environnement et exécuter les playbooks Ansible. Voici ce que fait ce script :

- **Tronquer le fichier known\_hosts** : Supprime les anciennes entrées d'hôtes connus pour éviter les conflits SSH.
- **Attendre 20 secondes** : Assure que le conteneur LXC est prêt avant de continuer.
- **Changer de répertoire** : Se déplace vers le répertoire contenant les playbooks Ansible.
- **Exécuter le script Expect** : Appelle un script Expect pour gérer les commandes interactives nécessaires à l'exécution des playbooks Ansible.
## <a name="_toc167621262"></a>3. Script Expect pour Gérer les Demandes de Mot de Passe
Un script Expect est utilisé pour automatiser l'exécution des playbooks Ansible nécessitant une entrée de mot de passe. Ce script gère les invites interactives telles que l'entrée du mot de passe BECOME et la confirmation des connexions SSH.

Voici ce que fait le script Expect :

- **Première exécution du playbook** : Exécute un playbook nécessitant un mot de passe BECOME.
- **Deuxième exécution du playbook** : Exécute un deuxième playbook avec des options détaillées et gère la confirmation de connexion SSH sans mot de passe.
# <a name="_toc167621263"></a>Lancé la création et la configuration des VM

Pour lancer la création et la configuration automatique, il suffit de se rendre dans le fichier « terraform » en exécutant la commande suivante :

`   ````bash

`   `cd /home/mbureau/Webmason-terraform/terraform/

`   ````

Ensuite, exécutez la commande suivante :

\```bash

./terraform apply

`   ````

Quand la question « Enter a value: » s'affiche, répondez par « yes ».

Une fois cette étape réalisée, il faudra attendre environ 5 minutes pour que les machines virtuelles soient créées et configurées.


