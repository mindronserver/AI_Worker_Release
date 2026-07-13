# Public Release Publishing

The internal worker repo should build the Windows agent ZIP and publish it here.

Required release tag:

```text
windows-agent-latest
```

Required asset name:

```text
MindronAiWorkerAgent-windows.zip
```

If GitHub Actions publishes from another/private repo, that workflow needs a token secret with write access to this public repo.
Recommended secret name:

```text
AI_WORKER_RELEASE_TOKEN
```
