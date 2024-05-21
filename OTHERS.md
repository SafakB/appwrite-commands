# Others Appwrite Commands

### Valide Github Private Key

```php
CODE='if (openssl_pkey_get_private(getenv("_APP_VCS_GITHUB_PRIVATE_KEY")) === false) {
    echo "Invalid Private Key\n";
    exit(1);
} else {
    echo "Valid Private Key\n";
    exit(0);
}'

docker-compose exec appwrite php -r "$CODE"
```

**Single Line**
```
php docker compose exec appwrite php -r 'if (openssl_pkey_get_private(getenv("_APP_VCS_GITHUB_PRIVATE_KEY")) === false) { echo "Invalid Private Key\n"; exit(1); } else { echo "Valid Private Key\n"; exit(0); }'
```
