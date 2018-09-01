# Docker proxy server with Let's Encrypt support

Light and automated proxy-server for managing traffic to your containers 
base on your domain names.

Simple generating SSL (HTTPS) for your traffic using Let's Encrypt.


## Requirments
- docker 
- docker-compose

## How to use

Run command `bash proxy-server`
You should see something like this.

```
   PROXY SERVER
   ============
   More info about usage:
    - Nginx-proxy: https://github.com/jwilder/nginx-proxy
    - Let's Encrypt https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion

   Usage: bash flow.bash [command]
   -------------------------------
   Services:
    - nginx
    - letsencrypt
    - dockergen
   -------------------------------
   Commands:
    - start               # start proxy-server
    - stop                # stop proxy-server
    - clean               # clean all
    - log [serviceName]   # start live log
    - go [serviceName]    # start interactive shell in selected service
```


### Testing
 
Create docker-compose.yml and insert this code snippet:
```docker-compose.yml
version: '2'
services:
 
    test_1:
      image: jwilder/whoami
      environment:
        VIRTUAL_HOST: 'test1.domain.tld'
        LETSENCRYPT_HOST: 'test1.domain.tld'
        LETSENCRYPT_EMAIL: 'test@domain.tld'
        LETSENCRYPT_TEST: 'true'
      networks:
        - proxy-server
 
    test_2:
      image: jwilder/whoami
      environment:
        VIRTUAL_HOST: 'test1.domain.tld'
        LETSENCRYPT_HOST: 'test1.domain.tld'
        LETSENCRYPT_EMAIL: 'test@domain.tld'
        LETSENCRYPT_TEST: 'true'
      networks:
        - proxy-server
 
networks:
  proxy-server:
    external: true
```

Important is network section, which will connect container with proxy-server 
which is open to the internet (port 80, 443)
```
services:

	test_1:
...
      networks:
        - proxy-server
...
networks:
  proxy-server:
    external: true
```

Now run command `docker-compose up` which will start the testing containers.

That's it. 
