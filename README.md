# Ranger Admin (docker version)

## Summary ##

Kudos: [Coheigea's](https://github.com/coheigea/testcases) repo for some of the base work and [SiweiWang's](https://github.com/SiweiWang/apache_ranger_docker) repo for the mysql modifications as I was having issues with the postgres container.

This project contains the configuration required to run the Apache Ranger admin server in docker.
The primary use case for me is to test Ranger and Ranger plugins (primarily, integrations with other open source tooling i.e. Neo4J)

> Note:
> This project is provided as a quick and easy way to play around with the Apache Ranger admin service. It should not be deployed in production as it uses default security credentials, it is not secure with kerberos, auditing is not enabled, etc.

## Building the project ##

There are two main features (I have also inlcuded the dockerhub images if you dont want to build from scratch);

1. The Ranger Admin tool / container [[dockerhub]](https://cloud.docker.com/u/spydernaz/repository/docker/spydernaz/apache-ranger-admin)
2. The backend DB for storing policies [[dockerhub]](https://cloud.docker.com/repository/docker/spydernaz/apache-ranger-admin-db)

The simplest way to run the project is to use Docker Compose as follows:

```sh
docker-compose up
```

To run manually:

Create a network so that we can link containers:

```sh
docker network create my-network
docker run -p 5432:5432 --name dn --network my-network spydernaz/apache-ranger-admin-db:latest
docker run -p 6080:6080 -it --network my-network spydernaz/apache-ranger-admin:latest
```

You can also build from scratch if you wish by running:

```sh
cd ranger-admin
docker build -t localrepo/rangeradmin .
cd ../ranger-db
docker build -t localrepo/rangeradmindb
```

## Accessing the service ##

Once the Ranger admin server is started you can open a browser and navigate to:

[http://localhost:6080](http://localhost:6080) (credentials: admin/passw0rd)


