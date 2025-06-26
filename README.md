## Setup Commands

1. Download dependencies

    ```sh
    terraform init
    ````

2. Generate a SSH Key pair (or use an existing one). Generates two files, a Public and Private part. The public part is ment to be shared, while the private needs to be stored securely (it's your "password").

    ```sh
    ssh-keygen -t ed25519 -f ed_id
    ```

3. Apply configuration

    ```sh
    terraform apply
    ```

Clean up/Destroy deployment

    ```sh
    terraform destroy
    ```

## Log into server

1. Get the IP address from the deployment.

    ```sh
    terraform output
    ````

2. Connect through SSH using the **private key** from Setup Commands step #2. This uses the *root/admin* user to log in.

    ´´´sh
    ssh -i <path-to-private-key> root@<ip-address-of-server>
    ```
3. Play around with the server

## Confiugure the server

This step consists of installing any extra programs we need, by adding additional sources.
For this we need:

- Git
- .NET SDK

1. Add the repository for Microsoft packages (not included by default)

    ```sh
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb
    ````

2. Fetch the latest, registered, package data

    ```sh
    apt-get update
    ```

3. Download and update any pending package-updates

    ```sh
    apt-get upgrade
    ````

4. Install Git

    ```sh
    apt-get install git
    ````

5. Install .NET SDK 9.0

    ```sh
    apt-get install dotnet-sdk-9.0
    ```

## Build and start the application

1. Get the URL of the Git repository (this repository)
2. Clone it onto the server under the `app` directory

    ```sh
    git clone <url-to-repository> app
    cd app
    ```

3. Build the release version of the project

    ```sh
    cd src
    dotnet publish

## Noteworthy Directories and Files (on the server)

- `/var/log`: Default directory that programs write logs to (usually configured by the server admin).
- `/var/log/cloud-init-output.log`: Contains the cloud init logs, look here for errors and debugging.

## References

- [Cloud Init](https://cloudinit.readthedocs.io/en/latest/index.html)
- [Terraform Modules](https://developer.hashicorp.com/terraform/language/modules)
