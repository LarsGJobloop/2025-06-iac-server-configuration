## Setup Commands

1. Download dependencies

    ```sh
    terraform init
    ````

2. Generate a SSH Key pair (or use an existing)

    ```sh
    ssh-keygen -t ed25519 -f ed_id
    ```

3. Apply configuration

    ```sh
    terraform apply
    ```


Last:
Destroy deployment

    ```sh
    terraform destroy
    ```
