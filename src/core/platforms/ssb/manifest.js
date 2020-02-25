var manifest = {
  "auth": "async",
  "address": "sync",
  "manifest": "sync",
  "get": "async",
  "createLogStream": "source",
  "messagesByType": "source",
  "createHistoryStream": "source",
  "add": "async",
  "status": "async",
  "publish": "async",
  "getAddress": "sync",
  "getLatest": "async",
  "latest": "source",
  "latestSequence": "async",
  "whoami": "sync",
  "gossip": {
    "peers": "sync",
    "add": "sync",
    "ping": "duplex",
    "connect": "async",
    "changes": "source",
    "reconnect": "sync"
  },
  "invite": {
    "create": "async",
    "accept": "async",
    "use": "async"
  },
  "names": {
    "get": "async",
    "getImages": "async",
    "getImageFor": "async",
    "getSignifier": "async",
    "getSignifies": "async",
    "dump": "sync"
  },
  "private": {
    "publish": "async",
    "unbox": "sync"
  },
  "blobs": {
    "get": "source",
    "add": "sink",
    "ls": "source",
    "has": "async",
    "size": "async",
    "meta": "async",
    "want": "async",
    "push": "async",
    "changes": "source",
    "createWants": "source"
  },
  "ws": {},
}

module.exports = manifest
