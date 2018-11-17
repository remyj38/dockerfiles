Nginx image based on official release with Diffie-Hellman key generation

## Usage

Same as the [official image](https://hub.docker.com/_/nginx/)

### Extra environment variables:
| Variable              | Default          | Description |
| --------------------- | ---------------- | ----------- |
| `DH_FILE`             | `dhparam.pem`    | Filename of the key |
| `DH_PATH`             | `/etc/nginx/ssl` | Path of the key. If key is stored outside of the default path, it will be regenerated at container startup exept if it's located in a persistent volume |
| `DH_SIZE`             | 2048             | Size of the key |
| `FORCE_DH_GENERATION` | null             | If option is defined, the key will be regenerated, even if it exists |
