# enverter

`enverter` is a script for setting up the macOS environment.

## Usage

To use enverter, please run the following command.

```shell
sh src/int.sh
```

## Post-Initialization Steps

After the initial setup, there are a few additional steps you need to take to complete the configuration. Follow the instructions below:

1. Generate SSH keys by running the following command to create a new RSA key pair:
   ```
   ssh-keygen -t rsa
   ```

2. Install additional fonts required for your terminal. Use the following command to configure the Powerlevel10k theme and add the necessary fonts:
   ```
   p10k configure
   ```

3. Restart your terminal application to ensure that all the changes and configurations take effect.

By completing these steps, you will have successfully created SSH keys for secure authentication and installed the required fonts for an enhanced terminal experience. Make sure to restart your terminal to apply the changes.

## License

This project is licensed under the [MIT License](LICENSE).