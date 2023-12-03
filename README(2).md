# wlh-api: an api for a sortable "What Links Here" tool

Backand api for https://wlh.toolforge.org

## Local development

For local development we use an SSH tunnel to query the toolforge Wikipedia DB
replica. You must already have a toolforge account and be added to the
`wlh-api` project.

### Recomended build tools
* [nix](https://nixos.org/download.html) (installs local dependencies)
* [direnv](https://direnv.net/) (sets up local development environment variables)

If you have these both installed properly, `rustc`, `cargo`, and `just` will be
installed for you when you are in this directory.

### Setting up local secrets and db tunnel

Copy the secrets.example to secrets (which is in the .gitignore)

```
cp secrets.example secrets
```

Get the database credentials by running:

```
just show-db-creds

# or just show-db-creds <username> if your local username
# is different from your toolforge username
```

Edit `secrets` and replace the two "`REPLACE_ME`"s with the username and
password respectively.

Make sure the secrets get loaded with:

```
direnv reload
```

### Running the server

#### Initial Setup

If you have not connected to `dev.toolforge.org` before, you may need to perform
a SSH connection manually for the first time:

```bash
# replace <username> with your toolforge username
ssh <username>@dev.toolforge.org
```

If you are prompted to continue connecting, answer `yes`. Once you see the
Toolforge prompt appear, you are good to go. Type `exit` to close the
connection.

```bash
just run

# or just run <username> if your local username
# is different from your toolforge username
```

Running this command will open a tunnel through toolforge to the mysql replica
db. When you're totally done, run:

```bash
just kill-tunnel
```

to tear down the tunnel.

## Deploying

A deploy script is provided for convenience. To run it, just do the following:

```bash
just deploy

# an optional <username> argument is supported as above
```

## A note about this project's group

This project currently lives in the `abstract-wiki` group by necessity because
it needs access to the GitLab CI runners. It would eventually like to move out
of its parents' house and strike it out on its own in the `toolforge-repos`
group once that group has CI runners.
